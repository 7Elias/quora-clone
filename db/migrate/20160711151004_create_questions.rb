class CreateQuestions < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :title
			t.string :tag
			t.string :content
			t.integer :user_id #writer
			t.timestamps null: false
		end
	end
end
