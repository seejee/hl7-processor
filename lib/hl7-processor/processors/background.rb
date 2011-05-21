require 'resque'

module HL7Processor
  module Processors
    class Background

      def self.process(channels, llp_message)
        Resque.enqueue(ResqueHL7Job, channels, llp_message)
      end

    end

    class ResqueHL7Job
      @queue = :hl7_jobs

      def self.perform(channels, llp_message)
        HL7Processor::Channels.execute(channels, llp_message)
      end

    end
  end
end