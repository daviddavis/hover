# Hover

An API in ruby for Hover.com.

## Installation

Add this line to your application's Gemfile:

    gem 'hover'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hover

## Usage

Fire up irb and you're good to go:

```
> require 'rubygems'
> require 'hover'
> api = Hover::Api.new("username", "password")
> api.domains
# Hash with domains
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

For testing out the code via irb:

```
irb -Ilib -rhover
> api = Hover::Api.new("username", "password")
> api.domains
# Hash with domains
```
