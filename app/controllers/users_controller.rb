class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      redirect_to user_path @user
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to user_path(@user)
    else
      flash.alert = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :fname,
      :lname,
      :phone,
      :email,
      :role,
      :password,
      :password_confirmation
    )
  end
end
