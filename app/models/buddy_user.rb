class BuddyUser < ApplicationRecord
  belongs_to :user
  belongs_to :buddy

  validates :user_id, uniqueness: { scope: :buddy_id }
end
