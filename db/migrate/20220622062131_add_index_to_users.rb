class AddIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :invite_code, unique: true
    change_column_null :users, :invite_code, false
  end
end
