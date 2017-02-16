class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/cats"
    mail(to: "#{user.username}@coolexample.com", subject: "Welcome to 99 Cats!")
  end

end
