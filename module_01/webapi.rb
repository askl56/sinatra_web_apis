require 'sinatra'
require 'json'

users = {
  'andrew': { first_name: 'Andrew', last_name: 'Scott', age: 24 },
  'simon':    { first_name: 'Simon', last_name: 'Random', age: 26 },
  'john':     { first_name: 'John', last_name: 'Smith', age: 28 }
}

get '/' do
	'master the API'
end

get '/users' do
	users.map { |name, data| data.merge(id: name) }.to_json
end
