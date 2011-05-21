require_relative 'spec_helper'

describe Host do

  before(:all) do
    @port = 2075

    @host = HL7Processor::Host.new do |config|
      config.port      = @port
      config.processor = HL7Processor::Processors::Immediate
    end

  end

  context "creating a host" do

    it "should accept a config as a constructor parameter" do
      @host.config.port.should == @port
    end

  end

  context "starting a host" do

    it "should start a server loop on the specified port" do
      Socket.should_receive(:tcp_server_loop).with(@port)

      @host.start
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
      HL7Processor::Processors::Immediate.should_receive(:process)

      @host.start
    end
  end

end
