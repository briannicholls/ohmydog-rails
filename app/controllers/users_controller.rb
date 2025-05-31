class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, except: [:signup]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_user_modification, only: [:edit, :update]
  include ActionView::Helpers::NumberHelper

  def index
    @users = User.all.order(:fname)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def signup
    @user = User.create user_params
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Signup successful!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      flash.alert = @user.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user_modification
    unless @user == current_user || current_user&.admin?
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end

  def user_params
    if params.dig(:user, :phone).present?
      params[:user][:phone] = number_to_phone(params[:user][:phone], pattern: /(\d{1,4})(\d{3})(\d{4})$/, area_code: true)
    end

    required_params = params.require(:user)

    base_attrs = [
      :fname,
      :lname,
      :phone,
      :email,
      :password,
      :password_confirmation
    ]

    if current_user&.admin?
      required_params.permit(*(base_attrs + [:role]))
    else
      required_params.permit(*base_attrs)
    end
  end
end
