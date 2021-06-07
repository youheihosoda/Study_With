class CreateStudyMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :study_methods do |t|
      t.string :name

      t.timestamps
    end
  end
end
