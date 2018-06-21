require 'rails_helper'

RSpec.describe MusicianSkillPolicy do
  let(:user) { build :user }
  let(:musician_skill) { build :musician_skill }

  subject { described_class }

  permissions :create? do
    it 'grants permissions if user has musician account' do
      new_musician_skill = musician_skill
      expect(subject).to permit(new_musician_skill.musician.user, new_musician_skill)
    end

    it 'fails if user creates musician skill for another musician id' do
      new_musician_skill = musician_skill
      expect(subject).not_to permit(user, new_musician_skill)
    end
  end

  permissions :destroy? do
    it 'grants permissions if user deletes own musician skill' do
      new_musician_skill = musician_skill
      expect(subject).to permit(new_musician_skill.musician.user, new_musician_skill)
    end

    it 'fails if user deletes musician skill for another musician id' do
      new_musician_skill = musician_skill
      expect(subject).not_to permit(user, new_musician_skill)
    end
  end
end
