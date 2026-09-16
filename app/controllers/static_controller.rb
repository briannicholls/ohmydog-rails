class StaticController < ApplicationController
  def welcome
  end

  def signup
    @user = User.new
  end
end
