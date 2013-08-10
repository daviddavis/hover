# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hover/version'

Gem::Specification.new do |spec|
  spec.name          = "hover"
  spec.version       = Hover::VERSION
  spec.authors       = ["David Davis"]
  spec.email         = ["ddavis1@gmail.com"]
  spec.description   = %q{Hover.com API gem}
  spec.summary       = %q{Gem for using Hover.com's API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.6.7"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
