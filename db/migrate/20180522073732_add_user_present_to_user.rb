class AddUserPresentToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :is_present, :boolean
  end
end
