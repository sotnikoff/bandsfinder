module ApplicationHelper
  def user_place
    "#{current_user.city.region.country.title}, #{current_user.city.region.title}, #{current_user.city.title}"
  end
end
