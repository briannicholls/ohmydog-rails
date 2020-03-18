class ApplicationController < ActionController::Base


  def logged_in?
    !!(session[:user_id] && User.exists?(session[:user_id]))
  end
  helper_method :logged_in?

  def current_user
    User.find_by id: session[:user_id]
  end
  helper_method :current_user

  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end

end
