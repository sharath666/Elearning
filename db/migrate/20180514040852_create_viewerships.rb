class CreateViewerships < ActiveRecord::Migration[5.1]
  def change
    create_table :viewerships do |t|
      t.integer :lecture_id
      t.integer :user_id
      t.boolean :fully_watched_vedio

      t.timestamps
    end
  end
end
