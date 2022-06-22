class AddIndexToBuddies < ActiveRecord::Migration[6.1]
  def change
    add_index :buddies, :line_id, unique: true
  end
end
