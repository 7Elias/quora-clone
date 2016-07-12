class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :question

	def increase
		self.count += 1
	end

	def decrease
		self.count -= 1
	end

end
