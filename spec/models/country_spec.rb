require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'validates with title and description' do
    country = Country.new(title: 'Russia', code: '7')
    expect(country).to be_valid
  end

  it 'fails without title and code' do
    country = Country.new
    expect(country).not_to be_valid
  end

  it 'fails with short title' do
    country = Country.new(title: 'R', code: '7')
    expect(country).not_to be_valid
  end

  it 'fails without code' do
    country = Country.new(title: 'Russia')
    expect(country).not_to be_valid
  end
end
