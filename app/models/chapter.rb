class Chapter < ApplicationRecord
	belongs_to :course
	has_many :lectures
	has_many :comments
	validates :name, :position, presence:true
end
