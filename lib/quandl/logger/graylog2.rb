require 'gelf'
require 'quandl/configuration'

class Quandl::Logger::GrayLog2
  class << self

    def configure
      yield(configuration)
    end
  
    def configuration
      @configuration ||= Quandl::Logger::GrayLog2::Configuration.new({
        host:       'http://metrics.quandl.com/',
        port:       '12201',
        max_size:   'WAN',
      })
    end
  
  end
  
  class Configuration < Quandl::Configuration
    configures :host, :port, :max_size, :facility, :version, :level
  end
  
end