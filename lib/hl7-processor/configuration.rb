module HL7Processor
  class Configuration

    attr_reader :port, :message_processor

    def initialize(options)
      @port = options[:port]
      @message_processor = options[:message_processor]
    end

  end
end