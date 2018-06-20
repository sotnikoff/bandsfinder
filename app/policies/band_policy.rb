class BandPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true if user.present? && user.musician.present?
  end

  def create?
    true if user.present? && user.musician.present?
  end
end
