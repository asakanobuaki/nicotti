class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, success: 'ユーザーを作成しました'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @today = l Date.today #デコレイター行き
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, success: 'ユーザー情報を更新しました。'
    else
      flash[:danger] = '更新に失敗しました。'
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to root_path, info: 'ユーザーを削除しました。'
  end

  def reborn
    @user = User.find(current_user.id)
    @user.reset_life
    @user.save
    redirect_to users_path
  end


  private
    def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :target_number)
    end
end
