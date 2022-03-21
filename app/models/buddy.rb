class Buddy < ApplicationRecord
  has_many :buddy_users, dependent: :destroy
  has_many :users, through: :buddy_users

  validates :line_id, uniqueness: true, presence: true
end
