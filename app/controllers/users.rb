require 'byebug'

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		flash[:signup] = "Signed up successfully"
		redirect '/questions'
	else
		flash[:signup] = "Sign up failed"
		redirect '/'
	end
	
end

post '/signin' do 
	@user = User.find_by(email: params[:user][:email])
		unless @user.nil?
			if @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				flash[:signin] = "Welcome " + @user.fullname
				redirect '/questions'
			else
				flash[:signin] = "Invalid login or password"
				redirect '/'
			end
		else
			flash[:signin] = "please sign up first"
			redirect '/'
		end
end

post '/logout' do
	session.clear
	redirect '/'
end

get '/users/:id' do
	if logged_in?
		@user = User.find(params[:id])
		erb :"static/profile"
	else
		redirect '/'
	end
end

get '/user/:id/questions' do
	if logged_in?
		@user = User.find(params[:id])
		erb :"static/user_questions"
	else
		redirect '/'
	end
end

get '/user/:id/answers' do
	if logged_in?
		@user = User.find(params[:id])
		erb :"static/user_answers"
	else
		redirect '/'
	end
end