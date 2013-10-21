require 'cql'

module Quandl
class Logger
class Cql
  
  attr_accessor :client
  
  def initialize(client)
    @client ||= client
  end
  
end
end
end