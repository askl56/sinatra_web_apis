require 'sinatra'
require 'json'
require 'gyoku'

users = {
  'andrew': 	{ first_name: 'Andrew', last_name: 'Scott', age: 24 },
  'simon':    { first_name: 'Simon', last_name: 'Random', age: 26 },
  'john':     { first_name: 'John', last_name: 'Smith', age: 28 }
}

before do
  content_type 'application/json'
end

get '/' do
  'master the API'
end

['/users', '/users.json'].each do |path|
  get path do
    users.map { |name, data| data.merge(id: name) }.to_json
  end
end

get '/users.xml' do
	content_type 'application/xml'
	Gyoku.xml(users: users)
end
