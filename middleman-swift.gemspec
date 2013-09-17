# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-swift/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-swift"
  spec.version       = Middleman::Swift::VERSION
  spec.authors       = ["micalexander"]
  spec.email         = ["mic@emicalexander.com"]
  spec.description   = %q{middleman-swift is a Middleman static site generator Template that has native support for Slim and Sass and is based off the HTML5 Boilerplate}
  spec.summary       = %q{A Middleman template using Slim Sass.}
  spec.homepage      = "https://github.com/micalexander/middleman-swift"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "slim", "~> 2.0.0"
  spec.add_development_dependency "middleman-core", "~> 3.1.0"
end
