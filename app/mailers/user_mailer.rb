class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      mail to: @user.email, subject: "Welcome Email!!"
    end


    def contact_email(contact_us)
      @contact_us = contact_us
      @admin_info=AdminUser.find_by(id: @contact_us.admin_user_id)
      @user_info=User.find_by(id: @contact_us.user_id)
      mail(to: @admin_info.email, subject: @contact_us.message,from: @user_info.email)
    end
end


