class SearchController < ApplicationController
  def musicians
    @query = Musician.includes(:musician_skills).ransack(params[:q])
    @musicians = @query.result(distinct: true)
  end

  def bands; end
end
