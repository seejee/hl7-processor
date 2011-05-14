module HL7Processor
  class Configuration

    attr_reader :port

    def initialize(options)
      @port = options[:port]
    end

  end
end