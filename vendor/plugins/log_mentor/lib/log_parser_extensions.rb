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