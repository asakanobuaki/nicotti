class CreateBuddyUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :buddy_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :buddy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
