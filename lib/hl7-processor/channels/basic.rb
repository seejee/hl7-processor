module HL7Processor
  module Channels
    module Basic

      def for_all_messages(&block)
        @all_messages_block = block
      end

      def on(&block)
      end

      def handle(hl7)
        @all_messages_block.call(hl7)
      end

    end
  end
end