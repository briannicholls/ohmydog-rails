class WalksController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @walks ||= Walk.today.order(:window_start)
  end

  def new
    @walk = Walk.new
  end

  def create
    fix_params
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
    @walks = Walk.all.order(:window_start)
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

  def fix_params
    walk = params['walk']
    start_hour = walk['window_start(5i)'].split(':')[0]
    start_mins = walk['window_start(5i)'].split(':')[1]
    end_hour = walk['window_end(5i)'].split(':')[0]
    end_mins = walk['window_end(5i)'].split(':')[1]

    3.times.with_index do |i|
      walk["window_start(#{i+1}i)"] = walk["date(#{i+1}i)"]
      walk["window_end(#{i+1}i)"] = walk["date(#{i+1}i)"]
    end

    walk['window_start(4i)'] = start_hour
    walk['window_start(5i)'] = start_mins
    walk['window_end(4i)'] = end_hour
    walk['window_end(5i)'] = end_mins
  end
end
