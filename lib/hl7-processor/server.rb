require 'socket'

module HL7Processor
  class Server

    attr_reader :config

    def initialize(config)
      @config = config
    end

    def start
      Socket.tcp_server_loop(@config.port) do |socket, client_addrinfo|
        puts "hi"
        socket.close
      end
    end

  end
end
