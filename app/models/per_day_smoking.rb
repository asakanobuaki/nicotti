class PerDaySmoking < ApplicationRecord
  belongs_to :user

  validates :smoked_on, uniqueness: { scope: :user_id }
end
