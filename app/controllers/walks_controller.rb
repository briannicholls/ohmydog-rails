class WalksController < ApplicationController
  def index
    @walks ||= Walk.today
  end

  def new
    @walk = Walk.new
  end

  def create
    binding.pry
    @walk = Walk.create(walk_params)
    @walk.persisted? ? redirect_to(walk_path(@walk)) : render(:new)
  end

  def show
    @walk = Walk.find params[:id]
  end

  def edit
    @walk = Walk.find params[:id]
  end

  def update
    @walk = Walk.find params[:id]
    #binding.pry
    if @walk.update walk_params
      redirect_to walk_path(@walk)
    else
      flash.alert = "Update failed"
      render :edit
    end
  end

  def destroy
    walk = Walk.find params[:walk_id]
    walk.delete
  end

  def all
    @walks = Walk.all
    render :index
  end

  private

  def walk_params
    params.require(:walk).permit(
      :window_start,
      :window_end,
      :user_id,
      :pet_id,
      :notes,
      :walk_type,
      :completed?,
      :date
    )
  end
end
