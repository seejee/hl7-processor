module HL7Processor
  class Configuration
    attr_accessor :port, :processor, :channels

    def initialize
      @channels = []
    end

  end
end