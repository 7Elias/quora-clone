class AddUpvoteAndDownvoteToQuestions < ActiveRecord::Migration
	def change
		add_column :questions, :upvote, :integer, array: true, default: []
		add_column :questions, :downvote, :integer, array: true, default: []
	end
end
