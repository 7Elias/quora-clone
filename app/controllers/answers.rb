require 'byebug'

post '/answers/:id' do
	@question = Question.find(params[:id])
	@answer = @question.answers.new(answer: params[:answer][:answer], user_id: current_user.id)
	flash[:answer] = @answer.save ? "answer successfully added" : "error"
	redirect "/questions/#{params[:id]}"		
end


