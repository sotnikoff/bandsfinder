class RegionsController < ApplicationController
  def index
    @regions = Country.find(params[:country]).regions.alphabetical
    respond_to do |format|
      format.html { render :index, layout: nil }
      format.json { render json: @regions }
    end
  end
end
