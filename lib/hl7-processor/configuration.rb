module HL7Processor
  class Configuration

    attr_reader :port, :message_processor, :channels

    def initialize(options)
      @port              = options[:port]
      @message_processor = options[:message_processor]
      @channels          = options[:channels]
    end

  end
end