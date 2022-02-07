class SmokingsController < ApplicationController

  def new
  end

  def create
    @smoking = current_user.smokings.build
    @smoking.save!

    if current_user.smokings.where(created_at: Date.today.all_day).count > current_user.target_number
      @user = User.find(current_user.id)
      @user.excess_cigarette += 1
      @user.save

      # ここからモデルにメソッド作る方がいい
      if @user.excess_cigarette == 6
        @user.baldness!
      elsif @user.excess_cigarette == 8
        @user.cancer!
      end
    end
  end

  def destroy
    @smoking = current_user.smokings.order(created_at: :desc).limit(1)
    @smoking.destroy
  end
end