class BandRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_owner, only: %i[approve decline]

  def create
    authorize(BandRequest)
    find_or_create_br
    redirect_to band_path(params[:band_id])
  end

  def approve
    authorize(@band_request)
    ApproveBandRequest.call(@band_request)
    redirect_to band_path(@band_request.band.id)
  end

  def decline
    DeclineBandRequest.call(@band_request)
    redirect_to band_path(@band_request.band.id)
  end

  def revoke; end

  private

  def check_owner
    @band_request = BandRequest.find(params[:id])
    unless @band_request.band.user.id == current_user.id
      flash[:alert] = "You are not the owner of #{@band_request.band.id} band"
      redirect_to root_path
    end
  end

  def find_or_create_br
    BandRequest.find_or_create_by(musician_id: current_user.musician.id, band_id: params[:band_id])
  end
end
