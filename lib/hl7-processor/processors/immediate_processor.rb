module HL7Processor
  module Processors
    class ImmediateProcessor

      def self.process(message)
        puts "Received a message: #{message}"
      end

    end
  end
end