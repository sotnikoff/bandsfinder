class MusicianPolicy < ApplicationPolicy
  def index?
    true if user.present?
  end

  def show?
    true if user.present?
  end

  def edit?
    true if user.present? && user == musician.user
  end

  def create?
    true if user.present?
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
