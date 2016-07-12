get '/questions' do
	@question = Question.all.order(count: :desc)
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
	erb :"questions/question_details"
end

put '/questions/:id/upvote' do
	@question = Question.find(params[:id])
	@question.increase
	if @question.save 
		 flash[:answer] = "thanks for voting"
	else
		flash[:answer] = "failed to vote"
	end
	redirect "/questions/#{params[:id]}"	
end

put '/questions/:id/downvote' do
	@question = Question.find(params[:id])
	@question.decrease
	@question.save ? (flash[:answer] = "Thanks for voting") : (flash[:answer] = "failed to vote")
	redirect "/questions/#{params[:id]}"	
end