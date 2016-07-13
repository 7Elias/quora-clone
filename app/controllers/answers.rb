require 'byebug'

post '/answers/:id' do
	@question = Question.find(params[:id])
	@answer = @question.answers.new(answer: params[:answer][:answer], user_id: current_user.id)
	flash[:answer] = @answer.save ? "answer successfully added" : "error"
	redirect "/questions/#{params[:id]}"		
end

put '/answers/:id_a/upvote/question/:id_q' do 
	@answer = Answer.find(params[:id_a])
	unless @answer.upvote.include?(current_user.id)
		@answer.increase
		@answer.upvote << current_user.id
		@answer.downvote -= [current_user.id]
		@answer.save
	end
	return @answer.count.to_json
		# redirect "/questions/#{params[:id_q]}"
end

put '/answers/:id_a/downvote/question/:id_q' do
	@answer = Answer.find(params[:id_a])
	unless @answer.downvote.include?(current_user.id)
		@answer.downvote << current_user.id
		@answer.upvote -= [current_user.id]
		@answer.decrease
		@answer.save
	end 
	return @answer.count.to_json
	# redirect "/questions/#{params[:id_q]}"
end

delete '/answers/:id_a/delete/question/:id_q' do
	@answer = Answer.find(params[:id_a])
		if current_user.id == @answer.user_id
			@answer.destroy
			flash[:answer] = "Answer deleted" 
		else
			flash[:answer] = "Invalid action"
		end
	redirect "/questions/#{params[:id_q]}"
end

put '/answers/:id_a/edit/question/:id_q' do
	@answer = Answer.find(params[:id_a])
		if current_user.id == @answer.user_id
			@answer.update(answer: params[:answer][:answer])
			flash[:answer] = "updated"
		else
			flash[:answer] = "Invalid"
		end
	redirect "/questions/#{params[:id_q]}"
end