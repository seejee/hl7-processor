require_relative 'spec_helper'

describe Server do

  it "should accept a config as a constructor parameter" do
    config = Configuration.new(port: 2075)
    server = Server.new(config)

    server.config.port.should == 2075
  end

end
