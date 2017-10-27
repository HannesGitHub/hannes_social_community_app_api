class CreatePosts < ActiveRecord::Migration[5.0]
  def up
    create_table :posts do |t|
      t.string :title
      t.string :message
      t.integer :user_id
      t.boolean :is_active, defalut: true
      t.timestamps
    end
    add_foreign_key :posts, :users, column: :user_id
  end

  def down
    remove_foreign_key :posts, name: :user_id
    drop_table :posts
  end
end