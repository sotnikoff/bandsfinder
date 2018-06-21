class SearchController < ApplicationController
  before_action :authenticate_user!

  def musicians
    @query = Musician.includes(:musician_skills).page(params[:page]).ransack(params[:q])
    authorize @query
    @musicians = if params[:q]
                   @query.result(distinct: true)
                 else
                   []
                 end
  end

  def bands; end
end
