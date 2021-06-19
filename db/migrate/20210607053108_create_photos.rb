class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image_id
      t.integer :study_time_id
      t.index :study_time_id, name: "index_photos_on_study_time_id"
      t.timestamps
    end
  end
end
