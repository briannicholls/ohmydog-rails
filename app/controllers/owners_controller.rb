class OwnersController < ApplicationController
  before_action :redirect_if_not_logged_in
  include ActionView::Helpers::NumberHelper

  def index
    @owners = Owner.all.order(:fname)
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create owner_params
    redirect_to owner_path(@owner)
  end

  def show
    @owner = Owner.find params[:id]
    #@pets = @owner.pets
    redirect_to owner_pets_path(@owner)
  end

  def edit
    @owner = Owner.find params[:id]
  end

  def update
    @owner = Owner.find params[:id]
    if @owner.update owner_params
      redirect_to owner_path(@owner)
    else
      flash.alert = @owner.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def owner_params
    params[:owner][:phone] = number_to_phone(params[:owner][:phone], pattern: /(\d{1,4})(\d{3})(\d{4})$/, area_code: true)
    params[:owner][:phone2] = number_to_phone(params[:owner][:phone2], pattern: /(\d{1,4})(\d{3})(\d{4})$/, area_code: true)
    params.require(:owner).permit(
      :fname,
      :lname,
      :phone,
      :email,
      :role,
      :password,
      :password_confirmation,
      :address,
      :apartment_number,
      :zip_code,
      :door_code,
      :lockbox_code,
      :entry_instructions,
      :neighborhood,
      :phone2
    )
  end
end
