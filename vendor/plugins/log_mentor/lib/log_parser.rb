=begin
File: log_parser.rb

Description: Code that calls the parser and returns 'HTMLized' lines. Parser
was created using Treetop (http://treetop.rubyforge.org/). 

Credits: Many thanks to Aaron Gough for his post that can be found here:

http://thingsaaronmade.com/blog/a-quick-intro-to-writing-a-parser-using-treetop.html

Copyright (c) 2011 by Erin Lin Ptacek
NOTICE: This code be the property of Erin Lin Ptacek. This code is free to be used,
redistributed, modified, copied or worshipped. Use this code at your own risk. 

=end

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