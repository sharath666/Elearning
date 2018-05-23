class Instructor < ApplicationRecord
	validates :name, presence:true

	has_many :lectures
end
