class Course < ApplicationRecord
	has_many :chapters
	has_many :lectures
	has_many :comments
	validates :name , presence:true, uniqueness:true
	validates :image, :description, :curriculum, presence:true
end
