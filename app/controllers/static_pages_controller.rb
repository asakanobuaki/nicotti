class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[index terms privacy]
  def index; end

  def terms; end

  def privacy; end
end
