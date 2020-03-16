class ApplicationController < ActionController::Base
  before_action :configure_permitted_perameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_perameters
    devise_perameter_sanitizer.permit(:sign_up, keys[:first_name, :last_name])
  end
end
