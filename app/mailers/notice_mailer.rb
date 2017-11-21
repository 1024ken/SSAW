class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_seasons.subject
  #
  def sendmail_warmspring(warmspring)
    @warmspring = warmspring

    mail to: "1024.ken@gmail.com",
      subject: '[SSAW]ブログが投稿されました'
  end

  def sendmail_summer(summer)
    @summer = summer

    mail to: "1024.ken@gmail.com",
      subject: '[SSAW]ブログが投稿されました'
  end

  def sendmail_autumn(autumn)
    @autumn = autumn

    mail to: "1024.ken@gmail.com",
      subject: '[SSAW]ブログが投稿されました'
  end

  def sendmail_winter(winter)
    @winter = winter

    mail to: "1024.ken@gmail.com",
      subject: '[SSAW]ブログが投稿されました'
  end
end
