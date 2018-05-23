json.extract! lecture, :id, :name, :chapter_id, :description, :video_url, :video_duration, :course_id, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
