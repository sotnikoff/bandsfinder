require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  it 'validates with same passwords' do
    new_user = AdminUser.new(email: 'john@example.com',
                             password: '123456', password_confirmation: '123456')
    expect(new_user).to be_valid
  end

  it 'fails with not same passwords' do
    new_user = AdminUser.new(email: 'john@example.com',
                             password: '123456', password_confirmation: 'wrong')
    expect(new_user).not_to be_valid
  end

  it 'fails without email' do
    new_user = User.new(password: '123456', password_confirmation: '123456')
    expect(new_user).not_to be_valid
  end
end
