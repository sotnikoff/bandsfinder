class BandRequestsController < ApplicationController
  def create
    BandRequest.find_or_create_by(musician_id: current_user.id, band_id: params[:band_id])
  end

  def approve
  end

  def decline
  end

  def revoke
  end
end
