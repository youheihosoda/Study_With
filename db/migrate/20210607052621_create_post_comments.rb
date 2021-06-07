class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :post_id
      t.integer :favorite_id
      t.text :post_comment_text

      t.timestamps
    end
  end
end
