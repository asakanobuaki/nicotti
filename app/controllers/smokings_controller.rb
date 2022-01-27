class SmokingsController < ApplicationController

  def new
  end

  def create
    @smoking = current_user.smokings.build
    @smoking.save!
    redirect_to users_path, success: '喫煙を登録しました'
  end

  def destroy
  end
end
