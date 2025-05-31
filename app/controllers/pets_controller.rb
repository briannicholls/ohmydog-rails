class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet, only: [:show, :edit, :update]

  def index
    if params[:owner_id]
      @owner = Owner.find(params[:owner_id])
      @pets = @owner.pets
    elsif params[:query]
      @pets = Pet.where("LOWER(name) ~ ?", "#{params[:query].downcase}")
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
    @owner = @pet.owner
  end

  def edit
  end

  def update
    if @pet.update pet_params
      redirect_to pet_path(@pet)
    else
      flash.alert = @pet.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_pet
    @pet = Pet.find params[:id]
  end

  def pet_params
    params.require(:pet).permit(
      :name,
      :owner_id,
      :gender,
      :breed,
      :birthday,
      :temperament,
      :notes,
      :appearance,
      :image
    )
  end
end
