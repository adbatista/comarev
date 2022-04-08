class InvoiceMailer < ApplicationMailer
  def notify_user(user)
    @user = user

    mail(to: user.email, subject: "Your invoice")
  end
end
