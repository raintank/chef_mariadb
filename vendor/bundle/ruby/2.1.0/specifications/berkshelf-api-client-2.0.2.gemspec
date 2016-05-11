# -*- encoding: utf-8 -*-
# stub: berkshelf-api-client 2.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "berkshelf-api-client"
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jamie Winsor", "Michael Ivey", "Seth Vargo"]
  s.date = "2016-03-08"
  s.description = "API Client for communicating with a Berkshelf API server"
  s.email = ["jamie@vialstudios.com", "michael.ivey@riotgames.com", "sethvargo@gmail.com"]
  s.homepage = "http://berkshelf.com"
  s.licenses = ["Apache 2.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.8"
  s.summary = "API Client for communicating with a Berkshelf API server"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>, ["~> 0.9.1"])
      s.add_runtime_dependency(%q<httpclient>, ["~> 2.7.0"])
      s.add_runtime_dependency(%q<ridley>, ["~> 4.5"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<fuubar>, ["~> 1.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.13"])
      s.add_development_dependency(%q<spork>, ["~> 0.9"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
    else
      s.add_dependency(%q<faraday>, ["~> 0.9.1"])
      s.add_dependency(%q<httpclient>, ["~> 2.7.0"])
      s.add_dependency(%q<ridley>, ["~> 4.5"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<fuubar>, ["~> 1.1"])
      s.add_dependency(%q<rspec>, ["~> 2.13"])
      s.add_dependency(%q<spork>, ["~> 0.9"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
    end
  else
    s.add_dependency(%q<faraday>, ["~> 0.9.1"])
    s.add_dependency(%q<httpclient>, ["~> 2.7.0"])
    s.add_dependency(%q<ridley>, ["~> 4.5"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<fuubar>, ["~> 1.1"])
    s.add_dependency(%q<rspec>, ["~> 2.13"])
    s.add_dependency(%q<spork>, ["~> 0.9"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
  end
end
