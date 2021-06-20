class CreateStudyTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :study_times do |t|
      t.integer :user_id
      t.text :study_method
      t.integer :start_time
      t.integer :end_time
      t.integer :learning_detail_id
      t.integer :study_time_text_id
      t.integer :learning_time
      t.timestamps
    end
  end
end
