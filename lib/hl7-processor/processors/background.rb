require 'resque'

module HL7Processor
  module Processors
    class Background

      def self.process(message)
        Resque.enqueue(ResqueHL7Job, message)
      end

    end

    class ResqueHL7Job
      @queue = :hl7_jobs

      def perform(message)
        puts "Received a message: #{message}"
      end

    end
  end
end