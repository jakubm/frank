require 'sinatra'
require 'redis'

set :bind, '0.0.0.0'

def actual_counter
  host = 'redis'
  begin
    redis = Redis.new(host: host)
    return redis.incr 'frank-counter'
  rescue StandardError => e
    return e.to_s
  end
end

get '/' do
  "<h1>Hello, world!</h2>Actual counter: #{actual_counter}"
end

get '/counter' do
  actual_counter.to_s
end
