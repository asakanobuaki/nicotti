class AddIndexToPerDaySmokings < ActiveRecord::Migration[6.1]
  def change
    add_index :per_day_smokings, [:smoked_on, :user_id], unique: true
  end
end
