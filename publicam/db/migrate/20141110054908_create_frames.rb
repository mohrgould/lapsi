class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.integer :ts
      t.references :camera, index: true

      t.timestamps
    end
  end
end
