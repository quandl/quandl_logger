require 'pry'
require 'quandl/logger'

# use logger
logger = Logger.new( "./log/example.log" )

Quandl::Logger.use( logger )

Quandl::Logger.info('hello')