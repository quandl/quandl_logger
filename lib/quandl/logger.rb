require 'quandl/logger/version'

module Quandl
  class Logger
    class << self
  
      delegate 
        :<<, :add, :close, :datetime_format, :datetime_format=, 
        :debug, :debug?, :error, :error?, :fatal, :fatal?, :info, :info?, 
        :log, :unknown, :warn, :warn?, 
        # to logger, allowing nil
        to: :logger, allow_nil: true
        
      def logger
        @@logger if defined?(@@logger)
      end
      
      def use(value)
        @@logger = value
      end
  
    end=
    
  end
end

