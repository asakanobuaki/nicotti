class Smoking < ApplicationRecord
  belongs_to :user

  def start_time
    self.created_at
  end

end
