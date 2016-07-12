class AddCountToQuestions < ActiveRecord::Migration
	def change
		add_column :questions, :count, :integer, null: false, default: 0
	end
end
