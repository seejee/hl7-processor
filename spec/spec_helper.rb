require 'bundler/setup'
require 'rspec'

RSpec.configure do |c|
  include HL7Processor
end

module HL7Processor
end

