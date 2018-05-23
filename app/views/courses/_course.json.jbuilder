json.extract! course, :id, :name, :image, :description, :curriculum, :created_at, :updated_at
json.url course_url(course, format: :json)
