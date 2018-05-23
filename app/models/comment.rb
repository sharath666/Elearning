class Comment < ApplicationRecord
	belongs_to :lecture
	belongs_to :user

	validates :message, :user_id, presence:true
end
