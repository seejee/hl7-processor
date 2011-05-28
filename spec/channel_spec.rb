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

    define_filter :contains_hi do |hl7|
      hl7 == "hi"
    end

    when_matching :contains_hi do |hl7|
      @filtered_counter += 1
    end

  end

  before(:each) do
    @channel = TestChannel.new
  end

  context "when a message matches" do

    before(:each) do
      @channel.handle("hi")
    end

    it "should run through the all message block" do
      @channel.all_counter.should == 1
    end

    it "should be executed by the filtered block" do
      @channel.filtered_counter.should == 1
    end

  end

  context "when a message doesn't match" do

    before(:each) do
      @channel.handle("no match")
    end

    it "should run through the all message block" do
      @channel.all_counter.should == 1
    end

    it "should not be executed by the filtered block" do
      @channel.filtered_counter.should == 0
    end

  end


end