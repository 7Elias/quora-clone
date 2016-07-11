require 'byebug'

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		flash[:signup] = "Signed up successfully"
	else
		flash[:signup] = "Sign up failed"
	end
	redirect '/'
end

post '/signin' do 
	@user = User.find_by(email: params[:user][:email])
		unless @user.nil?
			if @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				flash[:signin] = "Welcome " + @user.fullname
			else
				flash[:signin] = "Invalid login or password"
			end
		else
			flash[:signin] = "please sign up first"
		end
	redirect '/'
end

post '/logout' do
	session.clear
	redirect '/'
end

get '/users/:id' do
end