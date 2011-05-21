#HL7 Processor

This library provides a simple way to accept and process LLP/HL7 messages.
At the moment only an object model is provided, but an easy-to-use DSL will be added later.

The following features will be implemented during the RMU course:

* Build a server to accept HL7 messages
* Expose a plugin model for building message handlers
* Persist the incoming messages to a message queue
* Write a plugin that stores parts of the message to a database
* Build a DSL to easily configure the host

The bin directory provides a few example scripts, but here are a few examples:

Starts a host on port 5900

    require 'hl7-processor'

    class LoggingChannel
      extend HL7Processor::Channels::Logging

      log_file "hl7.txt"

      for_all_messages do |hl7|
        log.info("Received a message:#{hl7}")
      end

    end

    host = HL7Processor::Host.new do |config|
      config.port      = 5900
      config.processor = HL7Processor::Processors::Immediate
      config.channels  = [LoggingChannel]
    end

    host.start

HL7 is transmitted via a protocol called LLP. To send an LLP message to the
host, use the following code:

    require 'hl7-processor'
    require 'socket'

    llp = HL7Processor::LLPMessage.from_hl7("hello!")

    socket = Socket.tcp("127.0.0.1", 5000)
    socket.write(llp.to_s)
    socket.close
  
