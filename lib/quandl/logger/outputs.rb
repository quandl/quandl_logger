class Quandl::Logger::Outputs
  class << self
    
    def info(*args)
      stdout(*args)
    end
    
    def debug(*args)
      stdout(*args)
    end
    
    def fatal(*args)
      stderr(*args)
    end
    
    def warn(*args)
      stderr(*args)
    end
    
    def error(*args)
      stderr(*args)
    end
    
    def stdout(*args)
      $stdout.puts( args.collect(&:to_s).join(', ') + "\n" )
    end
    
    def stderr(*args)
      $stderr.puts( args.collect(&:to_s).join(', ') + "\n" )
    end
    
    def method_missing(method_sym, *args, &block) 
      stdout(args)
    end
  
  end
end