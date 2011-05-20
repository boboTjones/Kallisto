require 'polyglot'
require 'treetop'
require "#{File.expand_path(File.dirname(__FILE__))}/log_parser_extensions.rb"

class LogParser
    Treetop.load("#{File.expand_path(File.dirname(__FILE__))}/log_line.treetop")
      
  def initialize(data="")
    @@parser = LogLineParser.new
    @data = data
  end
  
  def parse(str)
    tree = @@parser.parse(str)
    
    if tree.nil?
      raise Exception, "Parse failed at line #{@@parser.failure_line} for reason: #{@@parser.failure_reason}"
    end
    
    line = tree.elements.map {|x| x.to_html if x.respond_to? "to_html"}.compact!
    # line = tree.elements.reject {|x| !x.respond_to? "to_html"}
    return line.join(" ")
  end
  
  
  def to_html
    html = []
    if @data.empty?
      raise Exception, "No text was provided to parse."
    end
    @data.each do |d|
      html << parse(d)
    end
    return html.join("\n")
  end
end