class CitiesController < ApplicationController
  def index
    @cities = Region.find(params[:region]).cities.alphabetical
    respond_to do |format|
      format.html { render :index, layout: nil }
      format.json { render json: @cities }
    end
  end
end
