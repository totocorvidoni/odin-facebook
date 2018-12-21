class UserMailer < ApplicationMailer
  default from: 'notify@totobook.com'

  def welcome_email
    @user = current_user
    @url  = 'http://totobook.com'
    mail(to: @user.email, subject: 'Welcome to Totobook')
  end
end
