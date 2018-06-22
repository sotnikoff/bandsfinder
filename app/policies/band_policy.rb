class BandPolicy < ApplicationPolicy
  def index?
    true if user.present?
  end

  def show?
    true if user.present?
  end

  def new?
    true if user.present? && user.musician.present?
  end

  def create?
    true if user.present? && user.musician.present?
  end
end
