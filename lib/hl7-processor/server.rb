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
        message = socket.readlines
        MessageHandler.new(message)
        socket.close
      end
    end

  end
end
