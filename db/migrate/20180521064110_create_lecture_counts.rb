class CreateLectureCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :lecture_counts do |t|
      t.integer :user_id
      t.integer :lecture_id
      t.string :count

      t.timestamps
    end
  end
end
