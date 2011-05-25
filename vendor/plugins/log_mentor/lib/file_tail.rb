=begin
File: file_tail.rb

Description: A means of tailing plain log files.

Copyright (c) 2011 by Erin Lin Ptacek
NOTICE: This code be the property of Erin Lin Ptacek. This code is free to be used,
redistributed, modified, copied or worshipped. Use this code at your own risk. 

=end

class File
  module Tail
    def self.tail(filename, linecount=40)
      file = File.new filename
      x = File.size filename
      size = 5120 ? x : x < 5120
      file.seek(-size,IO::SEEK_END)
      data = file.read.split("\n")
      file.close
      return data.last(linecount)
    end
  end
end