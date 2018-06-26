class BandPolicy < ApplicationPolicy
  def index?
    true if user.present?
  end

  def show?
    true if user.present?
  end

  def edit?
    true if user.present? && band.user == user
  end

  def update?
    true if user.present? && band.user == user
  end

  def new?
    true if user.present? && user.musician.present?
  end

  def create?
    true if user.present? && user.musician.present?
  end

  private

  def band
    record
  end
end
