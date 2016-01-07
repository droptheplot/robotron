$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'robotron/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'robotron'
  s.version     = Robotron::VERSION
  s.authors     = ['Sergey Novikov']
  s.email       = ['novikov359@gmail.com']
  s.homepage    = 'https://github.com/droptheplot/robotron'
  s.summary     = 'Dynamic robots.txt for different Rails environments with Rack.'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir["{lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency 'rspec', '~> 3.4.0'
  s.add_development_dependency 'rack', '~> 1.6.4'
end
