class Message < ActiveRecord::Base
	validates :subject, :content, :recipient_id, presence: true

  belongs_to :sender, class: User 
  belongs_to :recipient, class: User
end
