require 'rest_client'
require 'json'

module Hover
  class Api
    URL = 'https://www.hover.com/api/'
    AUTH_URL = 'https://www.hover.com/signin'

    attr_accessor :client, :username, :password

    def initialize(username, password)
      self.username = username
      self.password = password

      session = authenticate(username, password)
      self.client = RestClient::Resource.new(URL, :cookies => {:hoverauth => session})
    end

    def authenticate(username, password)
      auth = {username: username, password: password}
      response = RestClient.post(AUTH_URL, auth) do |response, request, result|
        if response.code == 302
          return response.cookies["hoverauth"]
        else
          raise "Failed to authenticate"
        end
      end
    end

    def domains(params = {})
      response = get("domains", params)
      JSON.parse(response)["domains"]
    end

    def dns(params = {})
      response = get("dns", params)
      JSON.parse(response)["domains"]
    end

    def domain(id, params={})
      response = get("domains/#{id}", params)
      JSON.parse(response)["domain"]
    end

    def domain_dns(id, params={})
      response = get("domains/#{id}/dns", params)
      JSON.parse(response)["domains"].first["entries"]
    end

    def create_record(id, name, type, content)
      params = {:name => name, :type => type, :content => content}
      response = post("domains/#{id}/dns", params)
      JSON.parse(response)
    end

    def update_record(id, params={})
      response = get("dns/#{id}", params)
      JSON.parse(response)
    end

    [:get, :put, :post, :delete].each do |method|
      define_method(method) do |path, params={}|
        client[path].send(method, params)
      end
    end
  end
end
