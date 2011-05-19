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