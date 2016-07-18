class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	# check migration and association 
	belongs_to :user
	has_many :answers

	validates :title, :presence => true  

	def increase
		self.count += 1
	end

	def decrease
		self.count -= 1
	end

end
