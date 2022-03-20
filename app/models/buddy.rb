class Buddy < ApplicationRecord
  has_many :buddy_users, dependent: :destroy
  has_many :users, through: :buddy_users
end
