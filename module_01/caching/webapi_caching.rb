require 'sinatra'
require 'json'
require 'digest/sha1'

users = {
  andrew: 	{ first_name: 'Andrew', last_name: 'Scott', age: 24 },
  simon:    { first_name: 'Simon', last_name: 'Random', age: 26 },
  john:     { first_name: 'John', last_name: 'Smith', age: 28 }
}

before do
  content_type 'application/json'
  cache_control max_age: 60
end

get '/users' do
  etag Digest::SHA1.hexdigest(users.to_s)
  users.map { |name, data| data }.to_json
end