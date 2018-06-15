class SearchController < ApplicationController
  def musicians
    @query = Musician.includes(:musician_skills).page(params[:page]).ransack(params[:q])
    @musicians = if params[:q]
                   @query.result(distinct: true)
                 else
                   []
                 end
  end

  def bands; end
end
