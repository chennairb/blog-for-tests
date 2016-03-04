class UserMailer < ApplicationMailer

  def registered(user)
    mail(to: user.email)
  end
end
