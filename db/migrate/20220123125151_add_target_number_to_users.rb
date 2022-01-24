class AddTargetNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :target_number, :integer, null: false
  end
end
