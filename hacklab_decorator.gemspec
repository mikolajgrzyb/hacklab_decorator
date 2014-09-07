# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hacklab_decorator/version"

Gem::Specification.new do |s|
  s.name = 'hacklab_decorator'
  s.version = HacklabDecorator::VERSION
  s.authors = %w(Mikołaj\ Grzyb)
  s.summary = 'Gem created on hacklab.'
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.homepage    = "https://github.com/michal-samluk/hacklab_decorator"

  s.add_dependency 'request_store'
  s.add_development_dependency 'rake', '>= 0.9.2'
  s.add_development_dependency 'rspec', '~> 3.0.0'
  s.add_development_dependency 'rspec-mocks', '~> 3.0.0'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'sqlite3'

end