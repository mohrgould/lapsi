class AddLastFrameIdToCameras < ActiveRecord::Migration
  def change
    add_column :cameras, :last_frame_id, :integer, references: "frames"
  end
end
