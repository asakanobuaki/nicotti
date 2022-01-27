class CreatePerDaySmokings < ActiveRecord::Migration[6.1]
  def change
    create_table :per_day_smokings do |t|
      t.integer :number_of_smoking
      t.date :smoked_on
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
