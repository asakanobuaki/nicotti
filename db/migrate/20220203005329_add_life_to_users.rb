class AddLifeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :life, :integer, default: 1, null: false
  end
end
