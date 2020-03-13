class ApplicationController < ActionController::Base

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find session[:user_id]
    end

    def redirect_if_not_logged_in
      redirect_to root_path if !logged_in?
    end
  end
end
