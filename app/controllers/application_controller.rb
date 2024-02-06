class ApplicationController < ActionController::Base
  # ...
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_firstname_presence, unless: -> { complete_information_action? || action_name == 'update' }

  def check_firstname_presence
    if user_signed_in? && current_user.first_name.nil?
      redirect_to complete_information_path
    end
  end

  def complete_information_action?
    controller_name == 'registrations' && action_name == 'complete_information'
  end

  def configure_permitted_parameters

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :bio, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :bio, :photo])
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.first_name.nil?
      edit_user_registration_path
    else
      super
    end
  end
end
