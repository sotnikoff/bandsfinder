require 'rails_helper'

RSpec.describe Musician, type: :model do
  let(:user) { create :user }

  it 'validates with user' do
    musician = Musician.new(user: user)
    expect(musician).to be_valid
  end

  it 'fails without user' do
    musician = Musician.new(user: nil)
    expect(musician).not_to be_valid
  end
end
