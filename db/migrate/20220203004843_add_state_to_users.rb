class AddStateToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :state, :integer, default: 0, null: false
  end
end
