require 'logger'

require 'quandl/logger/version'

require "active_support"
require "active_support/inflector"
require "active_support/core_ext/hash"
require "active_support/core_ext/object"


module Quandl
  class Logger
    class << self
  
      delegate :<<, :add, :close, :datetime_format, :datetime_format=, 
        :debug, :debug?, :error, :error?, :fatal, :fatal?, :info, :info?, 
        :log, :unknown, :warn, :warn?, 
        # to logger, allowing nil
        to: :logger, allow_nil: true
        
      def logger
        @@logger if defined?(@@logger)
      end
      
      def use(value)
        return use_file(value)  if value.kind_of?( ::Logger ) || value.kind_of?(String)
      end
      
      def info_with_elapsed(message=nil, &block)
        timer = Time.now
        result = block.call
        info("#{message} (#{timer.elapsed.microseconds}ms)")
        result
      end
      
      protected
      
      def use_file(file)
        # convert string to logger
        file = ::Logger.new(file) if file.kind_of?(String)
        # assign Logger
        @@logger = file
      end
      
    end
    
  end
end

