class BuddiesController < ApplicationController
  def index
    @buddies = current_user.buddies
  end

  def destroy
    @buddy = Buddy.find(params[:id])
    @buddy.destroy
    redirect_to buddies_path, success: 'バディの連携を解除しました。'
  end
end
