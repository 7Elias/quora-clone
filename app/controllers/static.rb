require 'byebug'
require 'sinatra/flash'

get '/' do
	if logged_in? 
	  redirect '/questions'  
	else
 	  erb :"static/index"
 	end
end


# users#index GET /users gets all users
# User#new GET /users/new get form from user sign up
# User#create POST /users create new user
# USer#showw GET /users/:id get individual user
# user#edit GET /users/:id/edit gets form for editing
# Users#update PUT/PATCH /users/:id update user details
# Users#destroy DELETE /Users/:id delete users

# User model
# has_many: Questions

# Questions model
# belongs_to: user

# @user.questions.new(params[:question])

# questions#create POST /users/:id/questions <-- nested route

# anything not GET request, always redirect

# if its a GET request, display view file