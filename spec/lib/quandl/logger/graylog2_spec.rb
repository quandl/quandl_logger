# encoding: utf-8
require 'spec_helper'

describe Quandl::Logger::GrayLog2 do
  let(:logger){ Quandl::Logger::GrayLog2 }
  subject{ logger }
  
  config_path = Pathname.new("spec/fixtures/config/graylog2.yml")
  config_env = 'test'
  config = YAML.load_file( config_path )[config_env]

  [:debug, :info, :warn, :error, :fatal, :unknown].each do |level|
    it ".#{level}('message')" do
      subject.send(level, 'message')
    end
  end
  
  describe ".configure" do
    before(:each){
      logger.configure do |c|
        config.each do |key, value|
          c.send("#{key}=", value)
        end
      end
    }
    subject{ logger.configuration }
    
    config.each do |key, value|
      its(key){ should eq value }
    end
  end
  
  describe ".configuration" do
    subject{ logger.configuration }
    
    describe "#from_file" do
      
      before(:each){ logger.configuration.from_file( config_path, config_env) }
      subject{ logger.configuration.attributes }
      
      config.each do |key, value|
        its([key.to_sym]){ should eq value }
      end
      
    end
  end
  
end
