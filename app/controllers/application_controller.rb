class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :email, :password, :password_confirmation, :current_password])
  end

  def after_sign_in_path_for(resource_or_scope)
    walks_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private

  def set_current_user
    Current.user = current_user
  end
end
