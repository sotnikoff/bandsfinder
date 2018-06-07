class BandRequestsController < ApplicationController
  before_action :check_owner, only: %i[approve decline]

  def create
    BandRequest.find_or_create_by(musician_id: current_user.id, band_id: params[:band_id])
    redirect_to band_path(params[:band_id])
  end

  def approve
    operate_approval
  end

  def decline
    operate_decline
  end

  def revoke
  end

  private

  def check_owner
    @band_request = BandRequest.find(params[:id])
    unless @band_request.band.user.id == current_user.id
      flash[:alert] = "You are not the owner of #{@band_request.band.id} band"
      redirect_to root_path
    end
  end

  def operate_approval
    @band_request.status_approved! if @band_request.status_new?
    redirect_to band_path(@band_request.band.id)
  end

  def operate_decline
    @band_request.status_declined! if @band_request.status_new?
    redirect_to band_path(@band_request.band.id)
  end
end
