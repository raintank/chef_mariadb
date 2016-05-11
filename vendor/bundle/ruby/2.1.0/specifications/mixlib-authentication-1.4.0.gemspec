# -*- encoding: utf-8 -*-
# stub: mixlib-authentication 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mixlib-authentication"
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Opscode, Inc."]
  s.date = "2016-01-19"
  s.description = "Mixes in simple per-request authentication"
  s.email = "info@opscode.com"
  s.extra_rdoc_files = ["README.rdoc", "LICENSE", "NOTICE"]
  s.files = ["LICENSE", "NOTICE", "README.rdoc"]
  s.homepage = "http://www.opscode.com"
  s.rubygems_version = "2.4.8"
  s.summary = "Mixes in simple per-request authentication"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mixlib-log>, [">= 0"])
      s.add_runtime_dependency(%q<rspec-core>, ["~> 3.2"])
      s.add_runtime_dependency(%q<rspec-expectations>, ["~> 3.2"])
      s.add_runtime_dependency(%q<rspec-mocks>, ["~> 3.2"])
      s.add_development_dependency(%q<rake>, ["~> 10.4"])
    else
      s.add_dependency(%q<mixlib-log>, [">= 0"])
      s.add_dependency(%q<rspec-core>, ["~> 3.2"])
      s.add_dependency(%q<rspec-expectations>, ["~> 3.2"])
      s.add_dependency(%q<rspec-mocks>, ["~> 3.2"])
      s.add_dependency(%q<rake>, ["~> 10.4"])
    end
  else
    s.add_dependency(%q<mixlib-log>, [">= 0"])
    s.add_dependency(%q<rspec-core>, ["~> 3.2"])
    s.add_dependency(%q<rspec-expectations>, ["~> 3.2"])
    s.add_dependency(%q<rspec-mocks>, ["~> 3.2"])
    s.add_dependency(%q<rake>, ["~> 10.4"])
  end
end
