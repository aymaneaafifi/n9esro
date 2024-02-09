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
      cookies.encrypted[:user_id] = userByEmail.id
      unless userByEmail.valid_password?(params[:user][:password])
        redirect_to new_user_session_path, notice: "invalid password"
          return
      end
      users_online = Connect.first
      Connect.create(connected: [userByEmail.id]) if users_online.blank?
      unless users_online.blank?
        users_online.connected << userByEmail.id
        Connect.first.update(connected: users_online.connected.uniq )
      end

      OnlineChannel.broadcast_to(
        "connected",
        Connect.first.connected.to_json
      )
      super
    else
      redirect_to new_user_session_path, notice: "invalid email"
    end
  end

  def destroy
    cookies.delete(:user_id)
    users_online = Connect.first
    unless users_online.blank?
      users_online.connected.delete current_user.id
      Connect.first.update(connected: users_online.connected.uniq )
    end

    OnlineChannel.broadcast_to(
      "connected",
      Connect.first.connected.to_json
    ) if Connect.first
    super
  end

end
