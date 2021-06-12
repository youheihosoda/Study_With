class CreateStudyTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :study_times do |t|
      t.integer :user_id
      t.integer :study_text_id
      t.integer :study_method_id
      t.integer :time
      t.integer :start_time
      t.integer :end_time
      t.timestamps
    end
  end
end
