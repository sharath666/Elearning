class CreateLectures < ActiveRecord::Migration[5.1]
  def change
    create_table :lectures do |t|
      t.string :name
      t.integer :chapter_id
      t.text :description
      t.string :video_url
      t.string :video_duration
      t.integer :course_id

      t.timestamps
    end
  end
end
