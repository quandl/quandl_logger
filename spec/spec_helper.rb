if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require "rspec"
require 'factory_girl'
require 'pry'

factory_dir = File.join( File.dirname(__FILE__), 'factories/**/*.rb' )
Dir.glob( factory_dir ).each{|f| require(f); puts f }

require "quandl/logger"

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

# binding.pry