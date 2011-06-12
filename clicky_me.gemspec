# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "clicky_me/version"

Gem::Specification.new do |s|
  s.name        = "clicky_me"
  s.version     = ClickyMe::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Eric Berry"]
  s.email       = ["cavneb@gmail.com"]
  s.homepage    = "http://github.com/cavneb/clicky_me"
  s.summary     = %q{Use the clicky.me API to shorten URLs}
  s.description = %q{Use the clicky.me API to shorten URLs}

  s.rubyforge_project = "clicky_me"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
