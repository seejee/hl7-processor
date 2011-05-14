require_relative 'spec_helper'

describe Server do

  before(:all) do
    @port = 2075
    @config = Configuration.new(port: @port)
    @server = Server.new(@config)
  end

  context "creating a server" do

    it "should accept a config as a constructor parameter" do
      @server.config.port.should == @port
    end

  end

  context "starting a server" do

    it "should start a server loop on the specified port" do
      Socket.should_receive(:tcp_server_loop).with(@port)

      @server.start
    end

  end

  context "receiving a message" do

    it "should pass the socket to a socket handler" do
      mock_socket = mock "sock"
      Socket.stub(:tcp_server_loop).with(@port).and_yield(mock_socket, nil)
      mock_socket.should_receive(:close)

      @server.start
    end

  end

end
