class AddColumnToLecture < ActiveRecord::Migration[5.1]
  def change
  	add_column :lectures, :instructor_id, :integer
  end
end
