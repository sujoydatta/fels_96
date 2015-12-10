class UserMailer < ApplicationMailer
  def monthly_statistics
    @users = User.all.non_admin

    @users.each do |user|
      mail to: user.email, subject: t(:monthly_email_subject)
    end
  end
end
