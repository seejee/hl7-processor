require 'logger'

module HL7Processor
  module Channels
    module Logging
      include Basic

      def log_file(filename)
        @log_file = filename
      end

      def log
        @log ||= Logger.new(@log_file)
      end

    end
  end
end