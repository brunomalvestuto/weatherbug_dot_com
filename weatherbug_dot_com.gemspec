# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "weatherbug_dot_com/version"

Gem::Specification.new do |s|
  s.name        = "weatherbug_dot_com"
  s.add_dependency 'nokogiri', '~> 1.4.4'
  s.version     = WeatherbugDotCom::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bruno Malvestuto"]
  s.email       = ["contact@brunomalvestuto.com"]
  s.homepage    = ""
  s.summary     = %q{weatherbug.com wrapper}
  s.description = %q{WeatherBug.com is a wrapper to the weatherbug.com api}

  s.rubyforge_project = "weatherbug_dot_com"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
