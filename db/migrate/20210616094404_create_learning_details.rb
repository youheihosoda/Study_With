class CreateLearningDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :learning_details do |t|
      t.text :detail
      t.integer :user_id

      t.timestamps
    end
  end
end
