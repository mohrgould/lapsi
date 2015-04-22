class RemovePathFromPicture < ActiveRecord::Migration
  def change
    remove_column :pictures, :path
  end
end
