module HL7Processor
  module Channels

    module BasicInstanceHelper

      def handle(hl7)
        instance_exec(hl7, &default_action) if default_action

        when_statements.each do |statement|
          filter     = filters[statement[:filter_name]]

          unless filter
            raise "could not find filter named #{statement[:filter_name]}"
          end

          is_a_match = instance_exec(hl7, &filter)
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

      def filters
        self.class.filters
      end

    end

    module Basic

      attr_reader :default_action, :when_statements, :filters

      def self.extended(other)
        other.class_eval do
          include BasicInstanceHelper
        end
      end

      def for_all_messages(&block)
        @default_action = block
      end

      def define_filter(name, &block)
        filters[name] = block
      end

      def when_matching(filter_name, &action)
        when_statements << {filter_name: filter_name, action: action }
      end

      def when_statements
        @when_statements ||= []
      end

      def filters
        @filters ||= {}
      end

    end

  end
end