require 'logger'

module HL7Processor
  module Channels
    module Logging
      include Basic

      attr_reader :log_filename

      def self.extended(other)
        other.class_eval do
          include LoggingInstanceHelper
        end
      end

      def log_file(filename)
        @log_filename = filename
      end

    end

    module LoggingInstanceHelper
      include BasicInstanceHelper

      def log
        @log ||= Logger.new(self.class.log_filename)
      end

    end
  end
end