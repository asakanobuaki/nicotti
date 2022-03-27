class AddColumnToBuddy < ActiveRecord::Migration[6.1]
  def change
    add_column :buddies, :name, :string
    add_column :buddies, :buddy_image, :string
  end
end
