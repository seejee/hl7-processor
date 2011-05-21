module HL7Processor
  module Processors
    class Immediate

      def self.process(channels, llp_message)
        HL7Processor::Channels.execute(channels, llp_message)
      end

    end
  end
end