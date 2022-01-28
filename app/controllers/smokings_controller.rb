class SmokingsController < ApplicationController

  def new
  end

  def create
    @smoking = current_user.smokings.build
    @smoking.save!

    if current_user.smokings.where(created_at: Date.today.all_day).count > current_user.target_number
      @user = User.find(current_user.id)
      @user.excess_cigarettes += 1
      @user.save
    end

    redirect_to users_path, success: '喫煙を登録しました'
  end

  def destroy
  end
end