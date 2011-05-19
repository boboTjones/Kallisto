# This is where the basic stuff will go for now.
# Check OS type, find logs based on OS, return raw or prettified lines.
# Some thoughts:
# Paths to logs cannot be specified by the user (directory traversal)
# Prettified lines should contain DOM-style identifiers that can be used with jquery for highlighting and filtering.
# eg, the hostname in a log is its own id or class.
# Get log file names once and store them in a config file in the base path
#
# Which is better? Create a global instance of LogMentor from inside the rails app and use that to poll?
# Or make the methods of LogMentor callable on the object?

require 'darwin_syslog_listener'
require 'file_tail'
require 'log_parser.rb'

class LogMentor
  
  attr_accessor :logpaths, :logfiles
  attr_reader :lines
  
  def initialize(os)
    @base_os = os
    @logpaths = ["/var/log"]
    @logfiles = get_logfiles
    @logfiles["syslog"] = "syslog" if @base_os == "Darwin"
    @lines = []
  end
  
  def get_logfiles
    # logfiles = {}
    # @logpaths.each do |path|
    #   filenames = Dir.entries(path).select {|d| d unless File.directory?("#{path}/#{d}")}
    #   logfiles[path] = Hash[filenames.map {|file| [file, File.stat("#{path}/#{file}")]}]
    # end
    # return logfiles
    ## XXX ToDo: I gave up and hard-coded this for now
    YAML.load(File.open("config/#{@base_os.downcase}.yml"))
  end
  
  def add_logpath(path)
    # Check for read perms?
    if File.exists? path
      self.logpaths << path
    end
  end
  
  def init
    case @base_os
    when "Darwin"
      listener = DarwinSyslogListener.new
      listener.go
    else
      raise "Cannot read logfile."
    end
  end
  
  def self.go
    lm = LogMentor.new `uname`.strip!
    lm.init
  end
  
  def poll(log="syslog")
    if log == "syslog"
      r = Redis.new
      r.lrange(log,-40,-1)
    else
      path = ""
      begin
        @logfiles.each {|k,v| path = k if v.include? log}
        File::Tail.tail "#{path}/#{log}" unless path.empty?
      rescue => e
        puts e
      end
    end
  end
  
  def rawlines(log="syslog")
    poll(log)
  end
  
  def prettylines(log="syslog")
    data = LogLineParse.new poll(log)
    data.to_html
  end
  
end