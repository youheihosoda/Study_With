class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.text :title
      t.text :name
      t.text :body
      t.boolean :is_deleted, default: false, null: false
      t.string :email

      t.timestamps
    end
  end
end
