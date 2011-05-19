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