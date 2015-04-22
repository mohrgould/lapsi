class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :path
      t.timestamp :taken_at

      t.timestamps
    end
  end
end
