require 'rails_helper'

RSpec.describe MusicianSkill, type: :model do
  let(:musician) { create :musician }
  let(:skill) { create :skill }

  it 'validates with skill, musician and valid comment' do
    musician_skill = MusicianSkill.new(musician: musician, skill: skill, comment: 'My comment')
    expect(musician_skill).to be_valid
  end
end
