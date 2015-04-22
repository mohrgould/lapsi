class AddUserIdToCameras < ActiveRecord::Migration
  def change
    add_column :cameras, :user_id, :integer, references: 'users'
    add_index :cameras, :user_id
  end
end
