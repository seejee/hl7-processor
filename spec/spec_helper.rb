require 'bundler/setup'
require 'rspec'
require 'hl7-processor'

RSpec.configure do |c|
  include HL7Processor
end

module HL7Processor

  def build_hl7_socket(hl7)
    llp = LLPMessage.from_hl7(hl7).to_s
    StringIO.new(llp)
  end

end

