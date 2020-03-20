class PetsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:owner_id]
      @owner = Owner.find(params[:owner_id])
      @pets = @owner.pets
    else
      @pets = Pet.all_az
    end
  end

  def new
    @pet = Pet.new
    if params[:owner_id]
      @pet.owner = Owner.find params[:owner_id]
    end
  end

  def create
    @pet = Pet.create pet_params
    if @pet.persisted?
      redirect_to pet_path(@pet)
    else
      flash.alert = @pet.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @pet = Pet.find params[:id]
    @owner = @pet.owner
  end

  def edit
    @pet = Pet.find params[:id]
  end

  def update
    @pet = Pet.find params[:id]
    if @pet.update pet_params
      redirect_to pet_path(@pet)
    else
      flash.alert = @pet.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def pet_params
    params.require(:pet).permit(
      :name,
      :owner_id,
      :breed,
      :birthday,
      :temperament,
      :notes,
      :appearance,
      :image
    )
  end
end
