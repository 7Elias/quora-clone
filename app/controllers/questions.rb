
get '/questions' do
	@question = Question.all.order(count: :desc)
	@question = @question.paginate(:page => params[:page], :per_page => 5)
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

get '/question/:id/edit' do
	@question = Question.find(params[:id])
	if current_user.id == @question.user_id
		erb :"questions/edit"	
	else
		flash[:answer] = "Invalid"
		redirect "/questions/#{params[:id]}"
	end
end

post '/question/:id/edit' do 
	if logged_in?
		@question = Question.find(params[:id])
		@question = @question.update(params[:question])
		if @question
			flash[:post] = "Successfully Posted"
		else
			flash[:post] = "Invalid Post"
		end
		redirect "/questions/#{params[:id]}"
	else
		redirect '/'#prompt user to log in first		
	end
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	@answers = @question.answers.order(count: :desc)
	@answers = @answers.paginate(:page => params[:page], :per_page => 5)
	erb :"questions/question_details"
end

post '/questions/:id/upvote' do
	@question = Question.find(params[:id])
	if @question.upvote.include?(current_user.id)
		@question.decrease
		@question.upvote -= [current_user.id]
		@question.downvote -= [current_user.id]
		@question.save
	else
		@question.increase
		@question.upvote << current_user.id
		@question.downvote -= [current_user.id]
		@question.save
	end
	return @question.count.to_json
	# redirect to "/questions/#{params[:id]}"	
end

post '/questions/:id/downvote' do
	@question = Question.find(params[:id])
	if @question.downvote.include?(current_user.id)
		@question.increase
		@question.downvote -= [current_user.id]
		@question.upvote -= [current_user.id]
		@question.save
	else
		@question.decrease
		@question.downvote << current_user.id
		@question.upvote -= [current_user.id]
		@question.save
	end
	return @question.count.to_json
	# redirect to "/questions/#{params[:id]}"	
end

get '/questions/tag/:tag' do
	@tag = Question.where(tag: params[:tag])
	erb :"questions/tag"
end