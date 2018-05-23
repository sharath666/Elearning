class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.integer :model_list_id
      t.boolean :is_create, default:false
      
      t.boolean :is_read, default:false
      t.boolean :is_update, default:false
      t.boolean :is_destroy, default:false
      t.integer :role_id

      t.timestamps
    end
  end
end
