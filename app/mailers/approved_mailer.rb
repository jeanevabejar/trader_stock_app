class ApprovedMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.approved_mailer.is_approved.subject
  #
  def is_approved(user_email)
    @user_email = user_email

    mail to: @user_email, subject: 'Your Account has been approved!'
   end
end
