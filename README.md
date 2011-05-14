#HL7 Processor

This library provides a simple way to accept and process HL7 messages.
At the moment only an object model is provided, but an easy-to-use DSL will be added later.

The following example starts a host on port 5000 and will print log received HL7 messages.

  config = HL7Processor::Configuration.new(port: 5000)
  host = HL7Processor::Host.new(config)
  
  host.start
  
