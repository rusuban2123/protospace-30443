class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name avatar occupation profile position])
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar occupation profile position])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar occupation profile position])
  end

  def after_sign_up_path_for
    root_path
  end
end