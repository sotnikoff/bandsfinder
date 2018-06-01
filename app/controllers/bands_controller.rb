class BandsController < ApplicationController
  def show
    @band = Band.find(params[:id])
  end

  def index; end

  def new
    @band = Band.new
  end

  def create
    band = Band.new(user_id: current_user.id)
    if band.save
      redirect_to band_path(band)
    else
      redirect_to root
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
