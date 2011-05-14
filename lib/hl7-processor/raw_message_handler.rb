module HL7Processor
  class RawMessageHandler

    def initialize(message)
      @message = message
    end

    def handle
      puts "Receieved a message: #{@message}"
    end

  end
end
