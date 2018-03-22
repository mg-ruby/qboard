$redis = Redis::Namespace.new("qaboard", redis: Redis.new)
if ENV["REDIS_URL"]
  $redis = Redis::Namespace.new("qaboard", redis: Redis.new(url: ENV["REDISCLOUD_URL"]))
end