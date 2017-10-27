class AddPasswordDigestForBcrypt < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :password_digest, :string
  end

  def down
    remove_column :users, :password_digest
  end
end
