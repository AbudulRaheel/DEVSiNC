# frozen_string_literal: true

module Users
  # RegistrationsController
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    before_action :user_params, only: [:update]

    # GET /resource/sign_up
    def index
      @user = Current.User
    end

    # PUT /resource
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_path(current_user.id), notice: 'Profile was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
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

    # The path used after sign up.
    # def after_sign_up_path_for(_resource)
    #   '/homepage/homepage'
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
