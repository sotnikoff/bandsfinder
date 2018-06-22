require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:country) { create :country }

  it 'validates with title and description' do
    new_region = Region.new(title: 'Moscow Oblast', code: '495', country: country)
    expect(new_region).to be_valid
  end

  it 'fails without region' do
    new_region = Region.new(title: 'Moscow Oblast', code: '495')
    expect(new_region).not_to be_valid
  end

  it 'fails without title' do
    new_region = Region.new(code: '495', country: country)
    expect(new_region).not_to be_valid
  end

  it 'fails with short title' do
    new_region = Region.new(title: 'M', code: '495', country: country)
    expect(new_region).not_to be_valid
  end
end
