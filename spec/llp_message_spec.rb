require_relative 'spec_helper'

describe LLPMessage do

  context "created from hl7" do

    before(:each) do
      @llp = LLPMessage.from_hl7('hl7')
    end

    it "should start with an llp header" do
      @llp.to_s.start_with?(LLPMessage::RECORD_HEADER).should == true
    end

    it "should contain the hl7 message" do
      @llp.to_s.include?('hl7').should == true
    end

    it "should contain a record trailed" do
      @llp.to_s.include?(LLPMessage::RECORD_TRAILER).should == true
    end

    it "should end with an llp carriage return" do
      @llp.to_s.end_with?(LLPMessage::CARRIAGE_RETURN).should == true
    end

  end

  context "created from llp" do

    before(:each) do
      llp_from_hl7 = LLPMessage.from_hl7('hl7')
      @llp = LLPMessage.from_llp(llp_from_hl7.to_s)
    end

    it "should expose the hl7" do
      @llp.hl7.should == 'hl7'
    end

  end

end