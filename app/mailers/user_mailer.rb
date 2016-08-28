class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  def notice_mail(user, comment)
    @comment = comment
    @user = user
    mail(:to => user.email, :subject => "Request Accept!")
  end

  def accept_mail(user, comment)
    @comment = comment
    @user = user
    mail(:to => user.email, :subject => "Request Accept!")
  end
end
