class AddUpvoteAndDownvoteToAnswers < ActiveRecord::Migration
	def change
		add_column :answers, :upvote, :integer, array: true, default: []
		add_column :answers, :downvote, :integer, array: true,default: []
	end
end
