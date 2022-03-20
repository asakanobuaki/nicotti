class AddColumnToBuddies < ActiveRecord::Migration[6.1]
  def change
    add_column :buddies, :line_id, :string, null: false
  end
end
