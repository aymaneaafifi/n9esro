# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def new
    super
  end

  def create

    userByEmail = User.find_by(email: params[:user][:email])
    if userByEmail
      cookies.encrypted[:user_id] = id
      redirect_to root_path
    else
      redirect_to new_user_session_path, notice: "invalid email"
    end
    super
  end

  def destroy
    super
    cookies.delete(:user_id)
  end
end
