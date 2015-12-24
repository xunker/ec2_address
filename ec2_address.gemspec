# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ec2_address/version'

Gem::Specification.new do |spec|
  spec.name          = 'ec2_address'
  spec.version       = Ec2Address::VERSION
  spec.authors       = ['Matthew Nielsen']
  spec.email         = ['xunker@pyxidis.org']

  spec.summary       = %q{Command line tool to quickly get the IP address of an Amazon AWS EC2 instance by name and can automate SSH'ing to them, too.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/xunker/ec2_address'
  spec.license       = 'GPL-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'trollop'
  spec.add_runtime_dependency 'aws-sdk'
end
