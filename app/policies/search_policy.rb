class SearchPolicy < ApplicationPolicy
  def musicians?
    true if user.present?
  end
end
