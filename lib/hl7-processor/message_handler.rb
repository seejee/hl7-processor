module HL7Processor
  class MessageHandler

    def initialize(message)
      @message = message
    end

    def handle
      puts"'Receieved a message: #{@message}"
    end

  end
end
