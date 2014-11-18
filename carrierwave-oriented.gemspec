$:.push File.expand_path("../lib", __FILE__)
require "carrierwave/oriented/version"

Gem::Specification.new do |s|
  s.name        = "carrierwave-oriented"
  s.version     = Carrierwave::Oriented::VERSION
  s.platform    = Gem::Platform::CURRENT
  s.authors     = ["Kevin Musselman"]
  s.email       = ["kmussel@gmail.com"]
  s.homepage    = "https://github.com/kmussel/carrierwave-oriented"
  s.summary     = %q{Oriented support for CarrierWave}
  s.description = %q{Oriented support for CarrierWave}

  s.rubyforge_project = "carrierwave-oriented"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "oriented", ["~> 0.0.1"]
  s.add_dependency "carrierwave", ["~> 0.10.0"]

  s.add_development_dependency "rake", ["~> 0.9.2"]
  s.add_development_dependency "rspec", ["~> 2.8"]
end