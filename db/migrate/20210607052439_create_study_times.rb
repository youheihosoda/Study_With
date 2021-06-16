class CreateStudyTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :study_times do |t|
      t.integer :user_id
      t.text :study_method
      t.integer :sum_time
      t.integer :start_time
      t.integer :end_time
      t.integer :post_id
      t.timestamps
    end
  end
end
