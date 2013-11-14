require 'pry'
require 'quandl/logger'

Quandl::Logger::GrayLog2.configure do |c|
  c.facility = 'quandl_logger'
end

Quandl::Logger.use( Quandl::Logger::GrayLog2 )

Quandl::Logger.info('hello')

binding.pry
