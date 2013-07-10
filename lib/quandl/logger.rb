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
      
      def info_with_elapsed(message=nil, &block)
        timer = Time.now
        result = block.call
        info("#{message} (#{timer.elapsed.microseconds}ms)")
        result
      end
      
      def use(log_file)
        log_file = ::Logger.new(log_file) if log_file.is_a?(String)
        @@logger = log_file
      end
  
    end
    
  end
end

