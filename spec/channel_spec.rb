require_relative "spec_helper"

describe "Channel creation" do

  class TestChannel
    extend Channels::Basic

    attr_reader :all_counter, :filtered_counter

    def initialize
      @all_counter      = 0
      @filtered_counter = 0
    end

    for_all_messages do |hl7|
      @all_counter += 1
    end

    when_matching -> hl7 {hl7 == "hi"} do |hl7|
      @filtered_counter += 1
    end

  end

  before(:each) do
    @channel = TestChannel.new
    @channel.handle("hi")
  end

  context "when a message matches" do

    it "should run through the all message block" do
      @channel.all_counter.should == 1
    end

    it "should run through the matched block" do
      @channel.filtered_counter.should == 1
    end

  end

end