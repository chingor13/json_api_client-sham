$:.push File.expand_path("../lib", __FILE__)

# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.

require 'json_api_client/sham/version'

Gem::Specification.new do |s|
  s.name = "json_api_client-sham"
  s.version = JsonApiClient::Sham::VERSION
  s.description = 'Mock json_api_client requests'
  s.summary = 'Use a rack application to fake json_api_client requests'

  s.add_dependency "json_api_client"
  s.add_dependency "sham_rack"
  s.add_dependency "sinatra"
  s.add_development_dependency "faraday"
  s.add_development_dependency "webmock"
  s.license = "MIT"

  s.author = "Jeff Ching"
  s.email = "ching.jeff@gmail.com"
  s.homepage = "http://github.com/chingor13/json_api_client-sham"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir.glob('test/*_test.rb')
end