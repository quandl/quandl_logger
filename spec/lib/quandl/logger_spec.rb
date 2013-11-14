# encoding: utf-8
require 'spec_helper'

describe Quandl::Logger do
  
  let(:client){ Cql::Client.connect( hosts: [ ENV['QUANDL_CASSANDRA_HOST'] ] ) }
  
  describe "#use" do
    
    subject{ Quandl::Logger }
    
    context "given String" do
      before(:each){ subject.use('development.log') }
      its(:logger){ should be_a ::Logger }
    end
    
    context "given Logger" do
      before(:each){ subject.use( ::Logger.new('development.log') ) }
      its(:logger){ should be_a ::Logger }
    end
    
    context "given Cql::Client" do
      before(:each){ subject.use( client ) }
      its(:logger){ should be_a Quandl::Logger::Cql }
    end
    
  end
  
end
