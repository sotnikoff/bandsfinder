module ApplicationHelper
  def user_place(user)
    "#{user.city.region.country.title}, "\
    "#{user.city.region.title}, #{user.city.title}"
  end
end
