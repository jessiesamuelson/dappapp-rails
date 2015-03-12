class User < ActiveRecord::Base
	has_secure_password
	validates :email, :password_digest, :username, :name, presence: :true
  validates :email, uniqueness: :true

  has_many :sent_messages, class_name: Message, foreign_key: :sender_id

  has_many :received_messages, class_name: Message, foreign_key: :recipient_id



	def tweets(opts = {})
		# make call to api with optional arguments
	end


#opts might look like

opts = {
	recent: true,
	count: 5
	# etc
}

	def get_tweets() 
		current_user.tweets(count: 10)

	end
end