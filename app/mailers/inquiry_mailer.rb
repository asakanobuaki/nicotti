class InquiryMailer < ApplicationMailer

  def inquiry_mail(inquiry)
    @inquiry = inquiry
    mail to: @inquiry.email, subject: '【お問い合わせ確認】'
  end

end
