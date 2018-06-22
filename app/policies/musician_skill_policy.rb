class MusicianSkillPolicy < ApplicationPolicy
  def create?
    true if user.present? && musician_skill.musician == user&.musician
  end

  def destroy?
    true if user.present? && musician_skill.musician == user&.musician
  end

  private

  def musician_skill
    record
  end
end
