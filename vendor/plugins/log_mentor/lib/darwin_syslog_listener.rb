=begin
File: darwin_syslog_listener.rb

Description: A listener for Darwin's syslog(1) command. Takes syslog output and 
stores it in redis.

Copyright (c) 2011 by Erin Lin Ptacek
NOTICE: This code be the property of Erin Lin Ptacek. This code is free to be used,
redistributed, modified, copied or worshipped. Use this code at your own risk. 

=end

class DarwinSyslogListener
  def initialize
  end

  module LogWatch
    def post_init
    end
    def caplog(filename,data)
      $redis ||= EM::Protocols::Redis.connect
      $redis.rpush filename, data
    end
    def receive_data data
      ## XXX ToDo: find some way to pass the key value in rather than hard-coding it?
      # caplog("syslog",data)
      data.split("\n").each {|d| caplog("syslog",d)}
    end
    def unbind
      puts get_status.exitstatus
    end
  end

  def go
    EM.run{EM.popen("/usr/bin/syslog -E none -w 40", LogWatch)}
  end
end