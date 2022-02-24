class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :smokings
  has_many :per_day_smokings

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :excess_cigarette, presence: true
  validates :target_number, presence: true
  validates :state, presence: true
  validates :life, presence: true

  enum state: { healthy: 0, baldness: 1, cancer: 2 }

  # 本日の残り喫煙本数(これは画面に表示する内容なのでデコレイターに書くべきなのか？)
  def remaining_number
    self.target_number.to_i - self.smokings.where(created_at: Date.today.all_day).count
  end

  def today_smokings
    self.smokings.where(created_at: Date.today.all_day).count
  end

  def reset_life
    self.excess_cigarette = 0
    self.life += 1
    self.healthy!
  end

end
