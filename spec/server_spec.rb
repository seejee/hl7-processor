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

    before(:each) do
      @socket = build_hl7_socket("hl7")
    end

    after(:each) do
      @socket.close
    end

    it "should pass the message to a raw message handler" do
      Socket.stub(:tcp_server_loop).with(@port).and_yield(@socket, nil)

      @server.start
    end
  end

end
