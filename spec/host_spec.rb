require_relative 'spec_helper'

describe Host do

  before(:all) do
    @port = 2075
    @config = HL7Processor::Configuration.new(
        port: 2075,
        message_processor: HL7Processor::Processors::ImmediateProcessor
    )
    @server = Host.new(@config)
  end

  context "creating a host" do

    it "should accept a config as a constructor parameter" do
      @server.config.port.should == @port
    end

  end

  context "starting a host" do

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

    it "should pass the message to the correct message processor" do
      Socket.stub(:tcp_server_loop).with(@port).and_yield(@socket, nil)
      @config.message_processor.should_receive(:process)

      @server.start
    end
  end

end
