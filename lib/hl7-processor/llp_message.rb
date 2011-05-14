module HL7Processor
  class LLPMessage

    RECORD_HEADER     = "\x0b"
    RECORD_TRAILER    = "\x1c"
    CARRIAGE_RETURN   = "\r"

    def self.from_hl7(hl7)
      llp = wrap_hl7(hl7)
      LLPMessage.new(llp)
    end

    def self.from_llp(llp)
      LLPMessage.new(llp)
    end

    def to_s
      @llp
    end

    private

    def self.wrap_hl7(hl7)
      llp = RECORD_HEADER
      llp << hl7
      llp << RECORD_TRAILER
      llp << CARRIAGE_RETURN
      llp
    end

    def initialize(llp)
      @llp = llp
    end

  end
end