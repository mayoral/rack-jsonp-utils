# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/jsonp/utils/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-jsonp-utils'
  spec.version       = Rack::JSONP::Utils::VERSION
  spec.authors       = ['Luis Mayoral']
  spec.email         = ['luis@luismayoral.com']
  spec.summary       = 'Some Rack middlewares to make easier for your app to support JSONP'
  spec.description   = 'Some Rack middlewares to make easier for your app to support JSONP'
  spec.homepage      = 'http://github.com/mayoral/rack-jsonp-utils'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rack', '>= 0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
