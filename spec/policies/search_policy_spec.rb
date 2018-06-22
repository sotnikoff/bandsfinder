require 'rails_helper'

RSpec.describe SearchPolicy do
  let(:user) { build :user }
  let(:musician) { create :musician }
  subject { described_class }

  permissions :musicians? do
    it 'succeeds if user has been presented' do
      musician
      musicians = Musician.all
      expect(subject).to permit(user, musicians)
    end

    it 'fails if user has not been presented' do
      musician
      musicians = Musician.all
      expect(subject).not_to permit(nil, musicians)
    end
  end
end
