require 'bundler/setup'
require 'rspec'
require 'hl7-processor'

RSpec.configure do |c|
  include HL7Processor
end

module HL7Processor

  def build_hl7_socket(hl7)
    StringIO.new(LLP_RECORD_HEADER + hl7 + LLP_RECORD_TRAILER + LLP_CARRIAGE_RETURN)
  end

end

