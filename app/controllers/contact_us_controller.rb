class ContactUsController < ApplicationController
    def index
    end

    def show
    end

    def new
        @user=User.find_by(id: current_user)
        @contact_us = ContactUs.new

    end
    def create

        @contact_us = ContactUs.new(contact_us_params)
        if @contact_us.save!
            UserMailer.contact_email(@contact_us).deliver_now
            redirect_to root_path, notice: "Message sent successfully!"
          else
            render :new, status: :unprocessable_entity
          end
        end

    def contact_us_params
        params.require(:contact_us).permit(:message, :user_id, :admin_user_id, :reply)
    end
end
