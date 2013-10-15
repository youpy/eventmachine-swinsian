# -*- encoding: utf-8 -*-
require File.expand_path('../lib/eventmachine-swinsian/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["youpy"]
  gem.email         = ["youpy@buycheapviagraonlinenow.com"]
  gem.description   = "An EventMachine extension to watch Swinsian"
  gem.summary       = "An EventMachine extension to watch Swinsian"
  gem.homepage      = "https://github.com/youpy/eventmachine-swinsian"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "eventmachine-swinsian"
  gem.require_paths = ["lib"]
  gem.version       = Eventmachine::Swinsian::VERSION

  gem.add_dependency('json')
  gem.add_dependency('eventmachine-distributed-notification', '>= 0.2.0')
  gem.add_development_dependency('rspec', ['~> 2.8.0'])
  gem.add_development_dependency('rake')
end
