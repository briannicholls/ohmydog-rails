class WalksController < ApplicationController
  def index
    @walks = Walk.all # add scope method for showing only walks for TODAY
  end

  def new
    @walk = Walk.new
  end

  def create
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
    if @walk.update walk_params
      redirect_to walk_path(@walk)
    else
      flash.alert = ""
      render :edit
    end
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
      :completed?
    )
  end
end
