class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :questions
	has_many :answers

	has_secure_password

	validates :fullname, :presence => true

	validates :email, :presence => true,
					  :uniqueness => { :case_sensitive => false },
					  :length => 5..128

	
	validates :password, :presence => true,
						:length => 6..128
	
end
