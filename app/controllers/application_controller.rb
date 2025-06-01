class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :email, :password, :password_confirmation, :current_password])
  end

  # Devise: Where to redirect users after sign in.
  def after_sign_in_path_for(resource_or_scope)
    walks_path
  end

  # Devise: Where to redirect users after sign out.
  def after_sign_out_path_for(resource_or_scope)
    root_path # welcome page
  end

  private

  def set_current_user
    Thread.current[:current_user] = current_user # current_user from Devise
  end

end
