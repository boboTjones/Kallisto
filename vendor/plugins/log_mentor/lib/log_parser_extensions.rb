=begin
File: log_parser_extensions.rb

Description: These are the callbacks for the log parser. Generates 'HTMLized' lines. Parser
was created using Treetop (http://treetop.rubyforge.org/). 

Credits: Many thanks to Aaron Gough for his post that can be found here:

http://thingsaaronmade.com/blog/a-quick-intro-to-writing-a-parser-using-treetop.html

Copyright (c) 2011 by Erin Lin Ptacek
NOTICE: This code be the property of Erin Lin Ptacek. This code is free to be used,
redistributed, modified, copied or worshipped. Use this code at your own risk. 

=end


module LogLine
  
  class Message < Treetop::Runtime::SyntaxNode
    def to_html
      "<span class='message'>" + text_value.to_s + "</span>"
    end
  end
  
  class Hostname < Treetop::Runtime::SyntaxNode
    def to_html
      host = text_value.to_s
      str = "<span class='hostname #{host}'>" + host + "</span>"
    end
  end
  
  class TimeStamp < Treetop::Runtime::SyntaxNode
    def to_html
      id = DateTime._parse(text_value.to_s).values.join
      str = "<div id='#{id}' class='logline'>" + self.text_value.to_s
      return str
    end
  end

  class Process < Treetop::Runtime::SyntaxNode
    def to_html
      "<span class='process'>" + text_value.to_s + "</span>"
    end
  end
  
  class Message
    def to_html
      ## XXX ToDo: stripping out <> for now.
      message = text_value.to_s.gsub(/[<>]/,"")
      "<span class='message'>" + message + "</span></div>"
    end
  end
  
  class Line < Treetop::Runtime::SyntaxNode
    def to_html
      ## XXX ToDo: find out why this doesn't work
      self.elements.map {|x| str << x.to_html if x.respond_to? "to_html"}.compact!
    end
  end
  
end