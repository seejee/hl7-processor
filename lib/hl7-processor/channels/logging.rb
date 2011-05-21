require 'logger'

module HL7Processor
  module Channels
    class Logging

      def initialize(filename = "hl7_log.txt")
        @log = Logger.new(filename)
      end

      def handle(hl7)
        @log.info("Received a message: #{hl7}")
      end

    end
  end
end