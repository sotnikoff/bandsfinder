FactoryBot.define do
  factory :user do
    name 'Ivan'
    email 'example@demo.com'
    password '1234567890'
    password_confirmation '1234567890'
    country
  end
end
