class AddInviteCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :invite_code, :string, unique: true
  end
end
