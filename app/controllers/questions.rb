get '/questions' do
	@question = Question.all
	erb :"questions/index"
end

#create - new
get '/questions/new' do
	erb :"questions/new"
end

#create - create
post '/questions' do 
	#if logged in, session[:user_id]
	if logged_in?
		@user = User.find(session[:user_id])
		@question = @user.questions.new(params[:question]) #one to many, both models need to specify, the many tables, needs to have the one integer as one of the column
		if @question.save
			flash[:post] = "Successfully Posted"
		else
			flash[:post] = "Invalid Post"
		end
		redirect '/questions'
	else
		redirect '/'#prompt user to log in first		
	end
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	@answer = Answer.all
	erb :"questions/question_details"
end
