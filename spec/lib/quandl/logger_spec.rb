# encoding: utf-8
require 'spec_helper'

describe Quandl::Logger do
  
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
    
  end
  
end
