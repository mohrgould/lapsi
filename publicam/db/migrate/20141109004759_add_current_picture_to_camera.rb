class AddCurrentPictureToCamera < ActiveRecord::Migration
  def change
    add_column :cameras, :current_picture_id, :integer, references: "pictures"
  end
end
