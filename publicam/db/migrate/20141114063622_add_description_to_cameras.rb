class AddDescriptionToCameras < ActiveRecord::Migration
  def change
    add_column :cameras, :description, :string
    add_index :cameras, :name, unique: true
  end
end
