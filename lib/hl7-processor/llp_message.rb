module HL7Processor
  class LLPMessage

    RECORD_HEADER     = "\x0b"
    RECORD_TRAILER    = "\x1c"
    CARRIAGE_RETURN   = "\r"

    def self.from_hl7(hl7)
      llp = wrap_hl7(hl7)
      LLPMessage.new(llp, hl7)
    end

    def self.from_llp(llp)
      hl7 = parse_hl7(llp)
      LLPMessage.new(llp, hl7)
    end

    attr_reader :llp, :hl7

    def to_s
      @llp
    end

    private

    def self.wrap_hl7(hl7)
      llp = ""
      llp << RECORD_HEADER
      llp << hl7
      llp << RECORD_TRAILER
      llp << CARRIAGE_RETURN
      llp
    end

    def self.parse_hl7(llp)
      header_index = llp.index(RECORD_HEADER)
      trailer_index = llp.index(RECORD_TRAILER)
      llp[header_index+1..trailer_index-1]
    end

    def initialize(llp, hl7)
      @llp = llp
      @hl7 = hl7
    end

  end
end