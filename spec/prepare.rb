require 'rspec'
require 'rack/test'
require 'rspec/expectations'


RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end

require_relative '../app.rb'
require_relative 'lib/rest_service.rb'
require_relative 'matchers/init.rb' 
