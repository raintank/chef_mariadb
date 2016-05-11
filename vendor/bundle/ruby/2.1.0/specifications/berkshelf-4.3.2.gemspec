# -*- encoding: utf-8 -*-
# stub: berkshelf 4.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "berkshelf"
  s.version = "4.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jamie Winsor", "Josiah Kiehl", "Michael Ivey", "Justin Campbell", "Seth Vargo"]
  s.date = "2016-04-06"
  s.description = "Manages a Cookbook's, or an Application's, Cookbook dependencies"
  s.email = ["jamie@vialstudios.com", "jkiehl@riotgames.com", "michael.ivey@riotgames.com", "justin@justincampbell.me", "sethvargo@gmail.com"]
  s.executables = ["berks"]
  s.files = ["bin/berks"]
  s.homepage = "http://berkshelf.com"
  s.licenses = ["Apache 2.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.8"
  s.summary = "Manages a Cookbook's, or an Application's, Cookbook dependencies"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>, [">= 2.3.4", "~> 2.3"])
      s.add_runtime_dependency(%q<berkshelf-api-client>, [">= 2.0.2", "~> 2.0"])
      s.add_runtime_dependency(%q<buff-config>, ["~> 1.0"])
      s.add_runtime_dependency(%q<buff-extensions>, ["~> 1.0"])
      s.add_runtime_dependency(%q<buff-shell_out>, ["~> 0.1"])
      s.add_runtime_dependency(%q<cleanroom>, ["~> 1.0"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.9"])
      s.add_runtime_dependency(%q<httpclient>, ["~> 2.7"])
      s.add_runtime_dependency(%q<minitar>, [">= 0.5.4", "~> 0.5"])
      s.add_runtime_dependency(%q<retryable>, ["~> 2.0"])
      s.add_runtime_dependency(%q<ridley>, ["~> 4.5"])
      s.add_runtime_dependency(%q<solve>, ["~> 2.0"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.19"])
      s.add_runtime_dependency(%q<octokit>, ["~> 4.0"])
      s.add_runtime_dependency(%q<celluloid>, ["= 0.16.0"])
      s.add_runtime_dependency(%q<celluloid-io>, ["~> 0.16.1"])
      s.add_development_dependency(%q<aruba>, ["~> 0.10.0"])
      s.add_development_dependency(%q<chef-zero>, ["~> 4.0"])
      s.add_development_dependency(%q<dep_selector>, ["~> 1.0"])
      s.add_development_dependency(%q<fuubar>, ["~> 2.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<spork>, ["~> 0.9"])
      s.add_development_dependency(%q<test-kitchen>, ["~> 1.2"])
      s.add_development_dependency(%q<webmock>, ["~> 1.11"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
      s.add_development_dependency(%q<http>, [">= 0.9.8", "~> 0.9"])
    else
      s.add_dependency(%q<addressable>, [">= 2.3.4", "~> 2.3"])
      s.add_dependency(%q<berkshelf-api-client>, [">= 2.0.2", "~> 2.0"])
      s.add_dependency(%q<buff-config>, ["~> 1.0"])
      s.add_dependency(%q<buff-extensions>, ["~> 1.0"])
      s.add_dependency(%q<buff-shell_out>, ["~> 0.1"])
      s.add_dependency(%q<cleanroom>, ["~> 1.0"])
      s.add_dependency(%q<faraday>, ["~> 0.9"])
      s.add_dependency(%q<httpclient>, ["~> 2.7"])
      s.add_dependency(%q<minitar>, [">= 0.5.4", "~> 0.5"])
      s.add_dependency(%q<retryable>, ["~> 2.0"])
      s.add_dependency(%q<ridley>, ["~> 4.5"])
      s.add_dependency(%q<solve>, ["~> 2.0"])
      s.add_dependency(%q<thor>, ["~> 0.19"])
      s.add_dependency(%q<octokit>, ["~> 4.0"])
      s.add_dependency(%q<celluloid>, ["= 0.16.0"])
      s.add_dependency(%q<celluloid-io>, ["~> 0.16.1"])
      s.add_dependency(%q<aruba>, ["~> 0.10.0"])
      s.add_dependency(%q<chef-zero>, ["~> 4.0"])
      s.add_dependency(%q<dep_selector>, ["~> 1.0"])
      s.add_dependency(%q<fuubar>, ["~> 2.0"])
      s.add_dependency(%q<rake>, ["~> 10.1"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<spork>, ["~> 0.9"])
      s.add_dependency(%q<test-kitchen>, ["~> 1.2"])
      s.add_dependency(%q<webmock>, ["~> 1.11"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
      s.add_dependency(%q<http>, [">= 0.9.8", "~> 0.9"])
    end
  else
    s.add_dependency(%q<addressable>, [">= 2.3.4", "~> 2.3"])
    s.add_dependency(%q<berkshelf-api-client>, [">= 2.0.2", "~> 2.0"])
    s.add_dependency(%q<buff-config>, ["~> 1.0"])
    s.add_dependency(%q<buff-extensions>, ["~> 1.0"])
    s.add_dependency(%q<buff-shell_out>, ["~> 0.1"])
    s.add_dependency(%q<cleanroom>, ["~> 1.0"])
    s.add_dependency(%q<faraday>, ["~> 0.9"])
    s.add_dependency(%q<httpclient>, ["~> 2.7"])
    s.add_dependency(%q<minitar>, [">= 0.5.4", "~> 0.5"])
    s.add_dependency(%q<retryable>, ["~> 2.0"])
    s.add_dependency(%q<ridley>, ["~> 4.5"])
    s.add_dependency(%q<solve>, ["~> 2.0"])
    s.add_dependency(%q<thor>, ["~> 0.19"])
    s.add_dependency(%q<octokit>, ["~> 4.0"])
    s.add_dependency(%q<celluloid>, ["= 0.16.0"])
    s.add_dependency(%q<celluloid-io>, ["~> 0.16.1"])
    s.add_dependency(%q<aruba>, ["~> 0.10.0"])
    s.add_dependency(%q<chef-zero>, ["~> 4.0"])
    s.add_dependency(%q<dep_selector>, ["~> 1.0"])
    s.add_dependency(%q<fuubar>, ["~> 2.0"])
    s.add_dependency(%q<rake>, ["~> 10.1"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<spork>, ["~> 0.9"])
    s.add_dependency(%q<test-kitchen>, ["~> 1.2"])
    s.add_dependency(%q<webmock>, ["~> 1.11"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
    s.add_dependency(%q<http>, [">= 0.9.8", "~> 0.9"])
  end
end
