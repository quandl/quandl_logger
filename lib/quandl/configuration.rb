require 'yaml'

module Quandl
class Configuration
  class << self
    
    attr_accessor :config_file, :config_env
    
    def from_file(file, env)
      self.config_file = file
      self.config_env = env
    end
    
    def configures(*names)
      define_attributes(*names)
    end
    
    def define_attributes(*names)
      Array(names).each{|name| define_attribute(name) }
    end
    
    def define_attribute(name)
      name = name.to_sym
      define_method(name) do
        read_attribute(name)
      end
      define_method("#{name}=") do |value|
        write_attribute(name, value)
      end
      define_method("#{name}?") do
        read_attribute(name).present?
      end
      # store an array of defined attriubte names
      attribute_names << name unless attribute_names.include?(name)
    end
    
    def attribute_names
      @attribute_names ||= []
    end
    
  end

  def initialize(*args)
    attrs = args.extract_options!
    self.attributes
    self.assign_attributes(attrs)
    from_file(self.class.config_file, self.class.config_env) if self.class.config_file.present? && self.class.config_env.present?
  end

  def from_file(path, env)
    config = YAML.load_file( path )[ env ]
    raise ArgumentError, "Unknown env #{env}" if config.nil?
    config.each{|k,v| self.send("#{k}=",v) if respond_to?("#{k}=") }
  end
  
  def assign_attributes(hash)
    hash.each do |k,v|
      send("#{k}=", v) if self.class.attribute_names.include?(k.to_sym) && respond_to?("#{k}=")
    end
  end
  
  def inspect
    "#{self.class.name} " + attributes.inspect
  end
  
  def attributes
    @attributes ||= self.class.attribute_names.inject({}){|m,k| m[k] ||= nil; m }
  end
  
  def attributes=(value)
    @attributes = value.symbolize_keys! if value.is_a?(Hash)
  end
  
  def write_attribute(attribute, value)
    @attributes[:"#{attribute}"] = value
  end
  
  def read_attribute(attribute)
    @attributes[:"#{attribute}"]
  end
  
end
end