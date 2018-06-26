require 'rails_helper'

RSpec.describe MusicianPolicy do
  let(:user) { build :user }
  let(:musician) { build :musician }
  let(:created_musician) { create :musician }

  subject { described_class }

  permissions :show? do
    it 'succeeds if user has been presented' do
      expect(subject).to permit(user, musician)
    end

    it 'fails if user has not been presented' do
      expect(subject).not_to permit(nil, musician)
    end
  end

  permissions :edit? do
    it 'succeeds if user is musician owner' do
      new_musician = musician
      expect(subject).to permit(new_musician.user, new_musician)
    end

    it 'fails if user is not musician owner' do
      expect(subject).not_to permit(user, musician)
    end
  end

  permissions :index? do
    it 'succeeds if user has been presented' do
      created_musician
      musicians = Musician.all
      expect(subject).to permit(user, musicians)
    end

    it 'fails if user has not been presented' do
      created_musician
      musicians = Musician.all
      expect(subject).not_to permit(nil, musicians)
    end
  end

  permissions :create? do
    it 'succeeds if user has been presented' do
      expect(subject).to permit(user, musician)
    end

    it 'fails if user has not been presented' do
      expect(subject).not_to permit(nil, musician)
    end
  end

  permissions :update? do
    it 'succeeds if user is musician owner' do
      new_musician = musician
      expect(subject).to permit(new_musician.user, new_musician)
    end

    it 'fails if user is not musician owner' do
      expect(subject).not_to permit(user, musician)
    end
  end

  permissions :destroy? do
    it 'succeeds if user is musician owner' do
      new_musician = musician
      expect(subject).to permit(new_musician.user, new_musician)
    end

    it 'fails if user is not musician owner' do
      expect(subject).not_to permit(user, musician)
    end
  end
end
