class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :smokings, dependent: :destroy
  has_many :per_day_smokings, dependent: :destroy
  has_many :buddy_users, dependent: :destroy
  has_many :buddies, through: :buddy_users

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, presence: true
  validates :excess_cigarette, presence: true
  validates :target_number, presence: true
  validates :state, presence: true
  validates :life, presence: true
  validates :role, presence: true
  validates :invite_code, uniqueness: true, presence: true

  enum state: { healthy: 0, baldness: 1, cancer: 2 }
  enum role: { general: 0, admin: 10, guest: 20 }

  def remaining_number
    self.target_number - today_smokings_count
  end

  def today_smokings_count
    self.smokings.where(created_at: Date.today.all_day).count
  end

  def target_over
    if self.today_smokings_count > target_number
      self.excess_cigarette += 1
      save
    end
  end

  def reborn?
    return false unless self.excess_cigarette == 10
    true
  end

  def user_state
    if self.excess_cigarette == 6
      baldness!
    elsif self.excess_cigarette == 8
      cancer!
    elsif self.excess_cigarette == 10
      self.reset_life
    end
  end

  def reset_life
    self.excess_cigarette = 0
    self.life += 1
    healthy!
    save
  end

end
