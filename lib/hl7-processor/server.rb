require 'socket'

module HL7Processor
  class Server

    MAX_MESSAGE_SIZE = 32 * 1024

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def start
      puts "Starting server"
      Socket.tcp_server_loop(@config.port) do |socket, client_addrinfo|
        message = socket.recv(MAX_MESSAGE_SIZE)
        MessageHandler.new(message)
        socket.close
      end
    end

  end
end
