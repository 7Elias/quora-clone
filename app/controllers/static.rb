require 'byebug'
require 'sinatra/flash'

get '/' do
  erb :"static/index"
end
