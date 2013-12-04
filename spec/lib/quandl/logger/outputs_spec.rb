# encoding: utf-8
require 'spec_helper'

describe Quandl::Logger::Outputs do
  let(:logger){ Quandl::Logger::Outputs }
  subject{ logger }

  [:info, :debug].each do |type|
    it "#{type} should puts 'hello #{type}' to $stdout" do
      $stdout.should_receive(:puts).with(%Q{hello #{type}\n})
      subject.send(type, %Q{hello #{type}})
    end
  end

  [:warn, :error, :fatal].each do |type|
    it "#{type} should puts 'hello #{type}' to $stderr" do
      $stderr.should_receive(:puts).with(%Q{hello #{type}\n})
      subject.send(type, %Q{hello #{type}})
    end
  end
  
end
