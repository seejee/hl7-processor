module HL7Processor
  module Channels

    module BasicInstanceHelper

      def handle(hl7)
        instance_exec(hl7, &default_action) if default_action

        when_statements.each do |statement|
          is_a_match = instance_exec(hl7, &statement[:predicate])
          instance_exec(hl7, &statement[:action]) if is_a_match == true
        end

      end

      private

      def default_action
        self.class.default_action
      end

      def when_statements
        self.class.when_statements
      end

    end

    module Basic

      attr_reader :default_action, :when_statements

      def self.extended(other)
        other.class_eval do
          include BasicInstanceHelper
        end
      end

      def for_all_messages(&block)
        @default_action = block
      end

      def when_matching(predicate, &action)
        when_statements << {predicate: predicate, action: action }
      end

      def when_statements
         @when_statements ||= []
      end

    end

  end
end