# frozen_string_literal: true

module Users
  # RegistrationsController
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]



    # GET /resource/sign_up
    def index
      @user = Current.User
    end

 

    # PUT /resource
    def update
      super
      render :edit unless @user.update(user_params)
    end


    protected

    def user_params
      params.require(:user).permit(:full_name, :email, :phone, :photo)
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name phone photo])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    end

    
  end
end
