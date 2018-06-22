require 'rails_helper'

RSpec.describe User, type: :model do
  let(:city) { build :city }

  it 'validates with same passwords and complete attributes' do
    new_user = User.new(name: 'John', email: 'john@example.com',
                        password: '123456', password_confirmation: '123456', city: city)
    expect(new_user).to be_valid
  end

  it 'fails with not same passwords and complete attributes' do
    new_user = User.new(name: 'John', email: 'john@example.com',
                        password: '12345689898', password_confirmation: '123456', city: city)
    expect(new_user).not_to be_valid
  end

  it 'fails without email' do
    new_user = User.new(name: 'John',
                        password: '123456', password_confirmation: '123456', city: city)
    expect(new_user).not_to be_valid
  end

  it 'fails without city' do
    new_user = User.new(name: 'John', email: 'john@example.com',
                        password: '12345689898', password_confirmation: '123456')
    expect(new_user).not_to be_valid
  end
end
