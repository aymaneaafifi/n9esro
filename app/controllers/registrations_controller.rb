class RegistrationsController < Devise::RegistrationsController

  def create
    super do |resource|
      if resource.errors.any? && resource.errors[:email].include?("has already been taken")
        redirect_to new_user_session_path
        return
      end
    end
  end


  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(resource)
    complete_information_path
  end
end
