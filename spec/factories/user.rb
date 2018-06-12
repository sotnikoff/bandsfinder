FactoryBot.define do
  factory :user do
    name 'Ivan'
    sequence(:email) { |n| "user#{n}@example.com" }
    password '1234567890'
    password_confirmation '1234567890'
    city
  end
end
