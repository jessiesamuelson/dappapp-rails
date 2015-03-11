class Message < ActiveRecord::Base
	validates :subject, :content, :recipient_id, presence: true

  belongs_to :sender_id, class: User 
  belongs_to :recipient_id, class: User
end
