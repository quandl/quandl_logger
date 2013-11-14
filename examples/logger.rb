require 'quandl/logger'

logger = Logger.new( File.join(Rails.root, "log/example.log") )

Quandl::Logger.use( logger )

Quandl::Logger.info('hello')

