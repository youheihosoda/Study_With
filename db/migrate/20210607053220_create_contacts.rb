class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.text :title
      t.text :body
      t.boolean :is_deleted, default: false, null: false

      t.timestamps
    end
  end
end
