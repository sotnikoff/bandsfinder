class BandsController < ApplicationController
  before_action :authenticate_user!

  def show
    @band = Band.find(params[:id])
    authorize @band
    @has_request = check_requests
  end

  def index
    @bands = Band.all
    authorize @bands
  end

  def new
    @band = Band.new
    authorize @band
  end

  def create
    band = Band.new(band_params.merge(user_id: current_user.id))
    authorize band
    if band.save
      redirect_to band_path(band)
    else
      redirect_to root_path
    end
  end

  def edit
    @band = Band.find(params[:id])
    authorize(@band)
  end

  def update
    @band = Band.find(params[:id])
    authorize(@band)
    if @band.update(band_params)
      redirect_to @band, notice: 'Band was successfully updated'
    else
      redirect_to @band, notice: 'Error happened when band was updating'
    end
  end

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
