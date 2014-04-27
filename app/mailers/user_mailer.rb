class UserMailer < ActionMailer::Base
  default from: "BumptUp@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.project_creation.subject
  #
  def project_creation(user)
    @user = user 
    @greeting = "Hi there bubba!"

    #mail to: "philip.m.garber@gmail.com", subject: "Project creation confirmation"
    mail to: user.email, subject: "Project creation confirmation"
  end
end
