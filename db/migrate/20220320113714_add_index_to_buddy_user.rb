class AddIndexToBuddyUser < ActiveRecord::Migration[6.1]
  def change
    add_index :buddy_users, [:user_id, :buddy_id], unique: true
  end
end
