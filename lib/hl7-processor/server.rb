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
        socket.each_line('\r') do |llp_line|
          RawMessageHandler.new(llp_line).handle
        end
      end

    end

  end
end
