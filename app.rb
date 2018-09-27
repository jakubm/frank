require 'sinatra'
require 'redis'

redis = Redis.new

get '/' do
  "<h1>Hello, world!</h2>Actual counter: #{redis.get 'frank-counter'}"
end

get '/counter' do
  counter = redis.incr 'frank-counter'
  counter.to_s
end
