class ApplicationController < ActionController::Base

  protected

  # Devise: Where to redirect users after sign in.
  def after_sign_in_path_for(resource_or_scope)
    walks_path
  end

  # Devise: Where to redirect users after sign out.
  def after_sign_out_path_for(resource_or_scope)
    root_path # welcome page
  end

end
