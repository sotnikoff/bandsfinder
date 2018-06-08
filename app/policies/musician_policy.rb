class MusicianPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    true if user.present? && user == musician.user
  end

  def destroy?
    true if user.present? && user == musician.user
  end

  private

  def musician
    record
  end
end
