require "hover/version"
require "hover/api"

# rest-client doesn't allow use to ssl_version (as of 1.6.7)
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:ssl_version] = 'TLSv1'

module Hover
  # Your code goes here...
end
