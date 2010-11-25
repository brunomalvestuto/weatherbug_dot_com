# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.add_runtime_dependency("nokogiri", ["~> 1.4.4"])
  s.authors = ["Bruno Malvestuto"]
  s.description = %q{weatherbug_dot_com is a wrapper to the weatherbug.com api}
  s.email = ["contact@brunomalvestuto.com"]
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files = `git ls-files`.split("\n")
  s.name = "weatherbug_dot_com"
  s.platform = Gem::Platform::RUBY
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.required_rubygems_version = ">= 1.3.7"
  s.summary = %q{weatherbug.com wrapper}
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = '0.0.1'
end
