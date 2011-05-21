module HL7Processor
  module Processors
    class Immediate

      def self.process(message)
        puts "Received a message: #{message}"
      end

    end
  end
end