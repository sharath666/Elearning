class Lecture < ApplicationRecord
	belongs_to :chapter
	belongs_to :course
	belongs_to :instructor
	has_many :comments
	validates :name, :description, :video_url, presence:true
	has_many :lecture_counts
end
