module HL7Processor
  module Channels
    class Logging

      def self.handle(hl7)
        puts "Received a message: #{hl7}"
      end

    end
  end
end