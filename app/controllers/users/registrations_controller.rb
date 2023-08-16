# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end
  def create
    # insert special code into instance and ensure that code is unique in database
    super

    @user = User.new(configure_sign_up_params)
    UserMailer.welcome_email(@user).deliver_now
    # continue to devise registration to CREATE user
    # resource.update special_code: special_code # may want to check model is still valid at this point and handle errors if not
  end
  # POST /resource
  # def create
    
  #   # super
  #   super do |user|
  #     byebug
  #     @user = User.new(configure_sign_up_params)
  #     UserMailer.welcome_email(user).deliver_now
  #   end
  # end

  #   end
  # end


  # def create
  #   @user=User.new(user_params)
  #   UserMailer.welcome_email(@user).deliver_now

  # end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end
  def configure_sign_up_params

    devise_parameter_sanitizer.permit(:sign_up, keys:[:full_name, :age, :address, :phone_number, :gender])
  end
  # def user_params
  #   params.require(:user).permit(:full_name,:age,:address,:phone_number,:gender)
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
