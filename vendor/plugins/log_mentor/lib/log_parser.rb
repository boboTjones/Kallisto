require 'polyglot'
require 'treetop'
require "#{Dir.pwd}/log_parser_extensions.rb"

class LogParser
  
  def initialize(data)
    Treetop.load("#{Dir.pwd}/log_line.treetop")
    @parser = LogLineParser.new
    @data = data
  end
  
  def parse(str)
    tree = @parser.parse(str)
    
    if tree.nil?
      raise Exception, "Parse failed at #{@@parser.failure_line} for reason #{@@parser.failure_reason}"
    end
    
    line = tree.elements.map {|x| x.to_html if x.respond_to? "to_html"}.compact!
    # line = tree.elements.reject {|x| !x.respond_to? "to_html"}
    return line.join(" ")
  end
  
  
  def to_html
    @data.split("\n").each do |d|
      html << parse(d)
    end
    return html.join("\n")
  end
end