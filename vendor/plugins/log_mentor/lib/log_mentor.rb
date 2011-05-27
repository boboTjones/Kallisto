=begin
File: log_mentor.rb

Description: A plugin that handles the gathering and parsing of log data. 

Copyright (c) 2011 by Erin Lin Ptacek
NOTICE: This code be the property of Erin Lin Ptacek. This code is free to be used,
redistributed, modified, copied or worshipped. Use this code at your own risk. 

=end

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
    if (@base_os == "Darwin" && log == "syslog")
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
    data = LogParser.new poll(log)
    data.to_html
  end
  
end