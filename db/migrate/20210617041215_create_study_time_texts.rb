class CreateStudyTimeTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :study_time_texts do |t|
      t.integer :study_time_id
      t.integer :study_text_id

      t.timestamps
    end
  end
end
