class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new; end

  def guest_login
    return redirect_to root_path, error: 'すでにログインしています' if current_user

    random_value = SecureRandom.hex(4)
    user = User.create!(name: 'ゲストユーザー',
                        email: "guest_#{random_value}@email.com",
                        password: random_value,
                        password_confirmation: random_value,
                        excess_cigarette: 5,
                        target_number: 2,
                        role: :guest,
                        invite_code: random_value)
    auto_login(user)
    redirect_to users_path, success: 'ゲストでログインしました'
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to :users, success: 'ログインしました'
    else
      flash.now[:error] = 'ログインできませんでした'
      render :new
    end
  end

  def destroy
    current_user.destroy! if current_user.guest?
    logout
    redirect_to root_path, info: 'ログアウトしました'
  end
end
