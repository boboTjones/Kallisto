=begin
File: redis_bits.rb

Description: Methods for redis functions. Not currently in use. I made it halfway to the 
refrigerator and forgot why I got up.

Copyright (c) 2011 by Erin Lin Ptacek
NOTICE: This code be the property of Erin Lin Ptacek. This code is free to be used,
redistributed, modified, copied or worshipped. Use this code at your own risk. 

=end

def push(filename,data)
  $redis ||= EM::Protocols::Redis.connect
  $redis.lpush filename, data
end

def pop(filename)
  $redis.rpop filename
end