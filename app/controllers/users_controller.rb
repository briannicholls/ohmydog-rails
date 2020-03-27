class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, except: [:signup]
  before_action :set_user, only: [:show, :edit, :update]
  include ActionView::Helpers::NumberHelper

  def index
    @users = User.all.order(:fname)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    @user.persisted? ? redirect_to(user_path(@user)) : render(:new)
  end

  def signup
    @user = User.create user_params
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to user_path(@user)
    else
      flash.alert = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params[:user][:phone] = number_to_phone(params[:user][:phone], pattern: /(\d{1,4})(\d{3})(\d{4})$/, area_code: true)
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
