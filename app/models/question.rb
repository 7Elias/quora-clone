class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	# check migration and association 
	belongs_to :user
	has_many :answers

	validates :content, :presence => true 
	validates :title, :presence => true  
end
