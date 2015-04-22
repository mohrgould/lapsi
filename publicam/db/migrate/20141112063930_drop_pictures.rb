class DropPictures < ActiveRecord::Migration
  def change
    remove_column :cameras, :current_picture_id
    drop_table :pictures
  end
end
