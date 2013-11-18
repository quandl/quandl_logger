class Quandl::Logger::Outputs
  
  def self.method_missing(method_sym, *args, &block) 
    puts(args)
  end
  
end
