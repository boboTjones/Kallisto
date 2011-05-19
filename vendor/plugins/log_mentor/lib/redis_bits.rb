## Not used.

def push(filename,data)
  $redis ||= EM::Protocols::Redis.connect
  $redis.lpush filename, data
end

def pop(filename)
  $redis.rpop filename
end