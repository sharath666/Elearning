class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.string :name
      t.integer :course_id
      t.string :position

      t.timestamps
    end
  end
end
