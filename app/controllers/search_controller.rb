class SearchController < ApplicationController
  def musicians
    @query = Musician.includes(:musician_skills).ransack(params[:q])
    @musicians = if params[:q]
                   @query.result(distinct: true)
                 else
                   []
                 end
  end

  def bands; end
end
