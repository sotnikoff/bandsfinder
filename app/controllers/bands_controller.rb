class BandsController < ApplicationController
  def show
    @band = Band.find(params[:id])
    @has_request = check_requests
  end

  def index
    @bands = Band.all
  end

  def new
    @band = Band.new
  end

  def create
    band = Band.new(band_params.merge(user_id: current_user.id))
    if band.save
      redirect_to band_path(band)
    else
      redirect_to root_path
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def band_params
    params.require(:band).permit(:title, :description, :genre_id, :image)
  end

  def check_requests
    request = BandRequest.where(musician_id: current_user&.musician, band_id: params[:id]).first
    request ? true : false
  end
end
