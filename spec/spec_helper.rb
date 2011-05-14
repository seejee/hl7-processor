require 'bundler/setup'
require 'rspec'
require 'hl7-processor'

RSpec.configure do |c|
  include HL7Processor
end

module HL7Processor
end

