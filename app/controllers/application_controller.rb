class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger

  private

  def not_authenticated
    flash[:error] = 'ログインしてください'
    redirect_to main_app.login_path
  end

end
