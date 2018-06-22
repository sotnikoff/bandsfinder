require 'rails_helper'

RSpec.describe City, type: :model do
  let(:region) { create :region }

  it 'validates with title and description' do
    new_city = City.new(title: 'Moscow', code: '495', region: region)
    expect(new_city).to be_valid
  end

  it 'fails without region' do
    new_city = City.new(title: 'Moscow', code: '495')
    expect(new_city).not_to be_valid
  end

  it 'fails without title' do
    new_city = City.new(code: '495', region: region)
    expect(new_city).not_to be_valid
  end

  it 'fails with short title' do
    new_city = City.new(title: 'M', code: '495', region: region)
    expect(new_city).not_to be_valid
  end
end
