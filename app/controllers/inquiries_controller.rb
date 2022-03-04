class InquiriesController < ApplicationController
  skip_before_action :require_login, only: [ :new, :create]


  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.inquiry_mail(@inquiry).deliver_later if @inquiry.email.present?
      redirect_to root_path, info: 'お問い合わせいただきありがとうございます'
    else
      render :new
    end
  end


  private

    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :category, :body)
    end
end
