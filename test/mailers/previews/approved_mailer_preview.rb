# Preview all emails at http://localhost:3000/rails/mailers/approved_mailer
class ApprovedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/approved_mailer/is_approved
  def is_approved
    ApprovedMailer.is_approved('admin@avion.com')
  end

end
