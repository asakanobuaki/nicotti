class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: %i[create show update edit destroy]

  def show; end
  def edit; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to users_path, success: 'ユーザーを作成しました'
    else
      flash.now[:error] = 'ユーザーを作成できませんでした'
      render :new
    end
  end

  def index
    @user = User.find(current_user.id)
    @smokings = current_user.smokings.where(created_at: Date.today.all_day)
  end

  def update
    if @user.update(user_params)
      redirect_to @user, success: 'ユーザー情報を更新しました。'
    else
      flash[:error] = '更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to root_path, info: 'ユーザーを削除しました。'
  end

  private
    def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :target_number)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
