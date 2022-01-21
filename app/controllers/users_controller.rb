class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: 'ユーザーを作成しました'
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
    def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
