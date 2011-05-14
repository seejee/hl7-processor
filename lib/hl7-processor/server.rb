require 'socket'

module HL7Processor
  class Server

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def start
      puts "Starting server"

      Socket.tcp_server_loop(@config.port) do |socket, client_addrinfo|
        begin
          start_loop(socket)
        rescue EOFError
          puts "Client closed the connection. Shutting down."
        end
      end

    end

    private

    def start_loop(socket)
      while(true)
        llp_line = socket.readline('\r')
        RawMessageHandler.new(llp_line).handle
      end
    end

  end
end
