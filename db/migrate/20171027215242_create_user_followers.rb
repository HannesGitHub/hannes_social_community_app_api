class CreateUserFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_followers, id: false do |t|
      t.integer :user_id
      t.integer :follower_id
    end
    add_foreign_key :user_followers,:users,column: :user_id,
                    primary_key: 'id'
    add_foreign_key :user_followers,:users,column: :follower_id,
                    primary_key: 'id'
  end
end
