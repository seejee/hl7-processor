module HL7Processor
  module Channels
    module Basic

      def for_all_messages(&block)
        @default_action = block
      end

      def when_matching(predicate, &action)
        on_statements << {predicate: predicate, action: action }
      end

      def handle(hl7)
        if(@default_action)
          @default_action.call(hl7)
        end

        on_statements.each do |statement|
          is_a_match = statement[:predicate].call(hl7)
          statement[:action].call(hl7) if is_a_match
        end

      end

      private

      def on_statements
        @on_statements ||= []
      end

    end
  end
end