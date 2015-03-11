class User < ActiveRecord::Base
	has_secure_password
	validates :email, :password_digest, :username, :name, presence: :true
  	validates :email, uniqueness: :true
end
