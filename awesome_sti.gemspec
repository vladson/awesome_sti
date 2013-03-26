# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'awesome_sti/version'

Gem::Specification.new do |spec|
  spec.name          = "awesome_sti"
  spec.version       = AwesomeSti::VERSION
  spec.authors       = ["Vladisalv Bogomolov"]
  spec.email         = ["vladson4ik@gmail.com"]
  spec.description   = %q{ Improvements for STI system of Ruby on rails }
  spec.summary       = %q{ Sti improvement for ruby on rails and activerecord }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
