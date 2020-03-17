class StaticController < ApplicationController

  def welcome

  end

  def signup
    @user = User.new
  end

  def google_login
    auth_hash = request.env['omniauth.auth']
    user_info = auth_hash['info']

    user = User.find_or_create_by email: user_info['email']
    user.update(
      fname: user_info['first_name'],
      lname: user_info['last_name'],
      password: SecureRandom.hex
    )

    session[:user_id] = user.id
    redirect_to user_path(user)
  end


end
