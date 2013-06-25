$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'app-tracker/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name          = "app-tracker"
  spec.version       = AppTracker::VERSION
  spec.authors       = ["Sahil Grover"]
  spec.email         = ["saahilgrover20@gmail.com"]
  spec.description   = %q{'A Gem to record and analyse the user activity on application'}
  spec.summary       = %q{'Application Logging'}
  spec.homepage    = "http://mindfiresolutions.com"
  spec.license       = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*"] + [ "Rakefile"]  #,"MIT-LICENSE","README.rdoc"
  spec.test_files = Dir["test/**/*"]

  spec.add_dependency "useragent", "~> 0.6.0"
  spec.add_dependency "will_paginate", "~> 3.0"
  spec.add_dependency "geocoder"
	spec.add_dependency "bundler"

  #spec.add_development_dependency "bundler", "~> 1.3"
  #spec.add_development_dependency "rake"
end
