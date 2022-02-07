class RenameExcessCigarettesColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :excess_cigarettes, :excess_cigarette
  end
end
