# encoding: utf-8
require 'spec_helper'

describe Quandl::Logger do
  
  describe "#use" do
    
    subject{ Quandl::Logger }
    
    it "should accept a String" do
      subject.use('development.log').logger.should be_a ::Logger
    end
    it "should accept a Logger" do
      subject.use( ::Logger.new('development.log') ).logger.should be_a ::Logger
    end
    # it "should accept a Cql::Client" do
    #   client = Cql::Client.new
    #   subject.use('development.log').logger.should be_a Quandl::Logger::Cql
    # end
  end
  
end
