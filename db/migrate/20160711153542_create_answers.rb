class CreateAnswers < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.string :answer
			t.integer :user_id
			t.integer :question_id
			t.timestamp null: false
		end
	end
end
