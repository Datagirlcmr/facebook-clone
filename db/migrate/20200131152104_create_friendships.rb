class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :status

      t.timestamps
    end
    add_index :friendships, [:user_id, :friend_id], unique: true
  end
end
