class CreateBuddies < ActiveRecord::Migration[6.1]
  def change
    create_table :buddies do |t|

      t.timestamps
    end
  end
end
