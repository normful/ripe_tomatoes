class UserMailer < ActionMailer::Base
  default from: "admin@ripemangoes.com"

  def farewell_email(user)
    @user = user
    email_with_name = "#{@user.full_name} <#{@user.email}>"
    mail(to: email_with_name, subject: 'Ripe Mangoes wishes you farewell!')
  end
end
