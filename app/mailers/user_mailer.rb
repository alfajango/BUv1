class UserMailer < ActionMailer::Base
  default from: "contact@prietary.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.project_creation.subject
  #
  def project_creation(user, project)
    @user = user 
    @project = project
    @greeting = "Hi there bubba!  Find me in user_mailer.rb"

    #mail to: "philip.m.garber@gmail.com", subject: "Project creation confirmation"
    mail to: user.email, subject: "Project creation confirmation"
  end

  def idea_creation(user, idea)
    @user = user 
    @idea = idea
    @greeting = "Hi there idea!  Find me in user_mailer.rb"

    #mail to: "philip.m.garber@gmail.com", subject: "Project creation confirmation"
    mail to: user.email, subject: "Idea creation confirmation"
  end

  def feedback_ask(askee)
    mail to: askee.email, subject: "Request for more information on feedback you gave"
  end

end
