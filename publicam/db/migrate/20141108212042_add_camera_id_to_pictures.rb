class AddCameraIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :camera_id, :integer, references: "cameras"
    add_index :pictures, :camera_id
  end
end
