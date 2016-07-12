require 'byebug'

post '/answers/:id' do
	@question = Question.find(params[:id])
	@answer = @question.answers.new(answer: params[:answer][:answer], user_id: current_user.id)
	flash[:answer] = @answer.save ? "answer successfully added" : "error"
	redirect "/questions/#{params[:id]}"		
end

put '/answers/:id_a/upvote/question/:id_q' do
	@answer = Answer.find(params[:id_a])
	@answer.increase
	@answer.save
	redirect "/questions/#{params[:id_q]}"
end

put '/answers/:id_a/downvote/question/:id_q' do
	@answer = Answer.find(params[:id_a])
	@answer.decrease
	@answer.save
	redirect "/questions/#{params[:id_q]}"
end
