class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, :authenticate_user!, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    puts "User role: #{resource.role}"
    if resource.role == "receptionist"
      puts "Redirecting to receptionist_root_path"
      receptionist_root_path
    elsif resource.role == "doctor"
      puts "Redirecting to doctor_root_path"
      doctor_root_path
    else
      puts "Using default redirect"
      super
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :role ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :role ])
  end

  private

  def user_not_authorized
    redirect_to root_path, alert: "You are not authorized to perform this action."
  end
end
