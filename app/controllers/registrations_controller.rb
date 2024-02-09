require "open-uri"


class RegistrationsController < Devise::RegistrationsController

  def create
    super do |resource|
      if resource.persisted? && resource.photo.blank?
        filename = 'football_icon.png'
        content_type = 'image/png'
        filepath = ActionController::Base.helpers.image_path(filename)

        resource.photo.attach(io: File.open("#{Rails.root}/app/assets/images/#{filename}"), filename:, content_type:)

        if resource.save
          puts "Default photo attached successfully"
        else
          puts "Error saving resource: #{resource.errors.full_messages.join(', ')}"
        end
      end

      if resource.errors.any? && resource.errors[:email].include?("has already been taken")
        redirect_to new_user_session_path
        return
      end

      users_online = Connect.first
      Connect.create(connected: [resource.id]) if users_online.blank?
      unless users_online.blank?
        users_online.connected << resource.id
        Connect.first.update(connected: users_online.connected.uniq )
      end

      OnlineChannel.broadcast_to(
        "connected",
        Connect.first.connected.to_json
      )

    end
  end

  def update
    super do |resource|
      resource.errors.add(:first_name, :blank, message: "can't be blank") if params[:user][:first_name].empty?
      resource.errors.add(:last_name, :blank, message: "can't be blank") if params[:user][:last_name].empty?
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
