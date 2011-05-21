require 'logger'

module HL7Processor
  module Channels
    module Logging

      def log_file(filename)
        @log_file = filename
      end

      def for_all_messages(&block)
        @all_messages_block = block
      end

      def log
        @log ||= Logger.new(@log_file)
      end

      def handle(hl7)
        @all_messages_block.call(hl7)
      end

    end
  end
end