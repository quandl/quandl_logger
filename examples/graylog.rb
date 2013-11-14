require 'quandl/logger'

# configure with block
# configures :host, :port, :max_size, :facility, :version, :level
Quandl::Logger::GrayLog2.configure do |c|
  c.facility = 'quandl_logger:test'
end

# or configure from file
# Quandl::Logger::GrayLog2.configuration.from_file('config/graylog2.yml', 'development')

# use graylog2 class directly
Quandl::Logger::GrayLog2.info('hi')

# or replace quandl logger with GrayLog2
Quandl::Logger.use( Quandl::Logger::GrayLog2 )

# send your message
Quandl::Logger.info('hello')