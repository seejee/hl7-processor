require 'socket'

module HL7Processor
  class Host

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def start
      puts "Listening for HL7 messages on port #{@config.port}."

      Socket.tcp_server_loop(@config.port) do |socket, client_addrinfo|
        begin
          read_socket(socket)
        rescue EOFError
          puts "Client closed the connection. Shutting down."
        end
      end

    end

    private

    def read_socket(socket)
      while(true)
        llp_line = socket.readline('\r')
        LLPMessageHandler.new(llp_line).handle
      end
    end

  end
end
