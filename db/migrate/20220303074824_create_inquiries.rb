class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :body
      t.integer :category, default: 0, null: false

      t.timestamps
    end
  end
end
