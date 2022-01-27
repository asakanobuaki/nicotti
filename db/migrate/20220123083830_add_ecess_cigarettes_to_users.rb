class AddEcessCigarettesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :excess_cigarettes, :integer, default: 0, null: false
  end
end
