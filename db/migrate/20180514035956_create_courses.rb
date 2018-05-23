class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :image
      t.text :description
      t.text :curriculum

      t.timestamps
    end
  end
end
