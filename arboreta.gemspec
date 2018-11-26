$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "arboreta/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "arboreta"
  s.version     = Arboreta::VERSION
  s.authors     = ["Tom Reis"]
  s.email       = ["tom@commercekitchen.com"]
  s.homepage    = ""
  s.summary     = <<-EOF

    Arboreta allows the creation, manipulation and execution of dynamic decision trees
    using built in logical expressions in combination with methods exposed from your
    application models.

  EOF

  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency "amoeba"

  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'rspec-rails', '~> 3.8'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'pg', '~> 0.18'
  s.add_development_dependency 'annotate'
end
