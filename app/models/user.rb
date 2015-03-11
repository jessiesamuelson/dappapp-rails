class User < ActiveRecord::Base
	has_secure_password
	validates :email, :password_digest, :username, :name, presence: :true
  validates :email, uniqueness: :true

  has_many :sent_messages, class_name: Message, foreign_key: :sender_id

  has_many :received_messages, class_name: Message, foreign_key: :recipient_id
end
