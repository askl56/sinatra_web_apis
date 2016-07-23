require 'sinatra'

use Rack::Auth::Basic, "User Area" do |username, password|
  username == 'john' && password == 'pass'
end

get '/' do
  'Sup'
end