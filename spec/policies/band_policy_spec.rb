require 'rails_helper'

RSpec.describe BandPolicy do
  let(:user) { build :user }
  let(:band) { build :band }
  let(:musician) { build :musician }

  subject { described_class }

  permissions :show? do
    it 'succeeds for any user' do
      new_band = band
      expect(subject).to permit(user, new_band)
      expect(subject).to permit(new_band.user, new_band)
    end
  end

  permissions :create? do
    it 'succeeds for user with musician page' do
      new_band = Band.new
      new_musician = musician
      expect(subject).to permit(new_musician.user, new_band)
    end

    it 'fails for user without musician page' do
      new_band = Band.new
      expect(subject).not_to permit(user, new_band)
    end
  end

  permissions :new? do
    it 'succeeds for user with musician page' do
      new_band = Band.new
      new_musician = musician
      expect(subject).to permit(new_musician.user, new_band)
    end

    it 'fails for user without musician page' do
      new_band = Band.new
      expect(subject).not_to permit(user, new_band)
    end
  end

  permissions :index? do
    it 'succeeds for any user' do
      new_band = band
      expect(subject).to permit(user, new_band)
      expect(subject).to permit(new_band.user, new_band)
    end
  end
end
