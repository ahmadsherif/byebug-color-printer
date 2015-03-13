# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'byebug-color-printer/version'

Gem::Specification.new do |spec|
  spec.name          = "byebug-color-printer"
  spec.version       = ByebugColorPrinter::VERSION
  spec.authors       = ['Ahmad Sherif']
  spec.email         = ['me@ahmadsherif.com']

  spec.summary       = %q{Colorize some Byebug output}
  spec.homepage      = 'https://github.com/ahmadsherif/byebug-color-printer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'byebug', '~> 4.0'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake', '~> 10.0'
end
