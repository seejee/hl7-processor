require_relative 'channels/basic.rb'
require_relative 'channels/logging.rb'

module HL7Processor
  module Channels
    extend self

    def execute(channels, llp_message)
      hl7 = llp_message.hl7
      channels.each {|c| c.handle(hl7)}
    end

  end
end