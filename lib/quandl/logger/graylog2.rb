require 'gelf'
require 'quandl/configuration'

class Quandl::Logger::GrayLog2
  class << self
    
    def method_missing(method_sym, *args, &block) 
      gelf.send(method_sym, *args)
    end
    
    def gelf
      @gelf ||= GELF::Notifier.new( configuration.host, configuration.port, configuration.max_size, configuration.options )
    end
    
    def configure
      yield(configuration)
    end
    
    def configuration
      @configuration ||= Quandl::Logger::GrayLog2::Configuration.new({
        host:       'metrics.quandl.com',
        port:       '12201',
        max_size:   'WAN',
      })
    end
    
  end
  
  class Configuration < Quandl::Configuration
    configures :host, :port, :max_size, :facility, :version, :level, :hostname
    
    def options
      [:hostname, :facility, :version, :level].inject({}){|m,k| m[k] = attributes[k] if attributes[k].present?; m }
    end
    
  end
  
end