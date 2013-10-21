require 'logger'

require 'quandl/logger/version'

require "active_support"
require "active_support/inflector"
require "active_support/core_ext/hash"
require "active_support/core_ext/object"

require 'quandl/logger/cql'

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
        case value.class
        when String       then use_file(value)
        when Cql::Client  then use_cql(value)
        else
          @@logger = value
        end
      end
      
      def info_with_elapsed(message=nil, &block)
        timer = Time.now
        result = block.call
        info("#{message} (#{timer.elapsed.microseconds}ms)")
        result
      end
      
      protected
      
      def use_file(file)
        @@logger = ::Logger.new(file)
      end
      
      def use_cql(client)
        @@logger = Quandl::Logger::Cql.new(client)
      end
      
    end
    
  end
end

