class CountriesController < ApplicationController
  def index
    @countries = Country.alphabetical
    respond_to do |format|
      format.html { render :index, layout: nil }
      format.json { render json: @countries }
    end
  end
end
