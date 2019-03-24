FactoryGirl.define do
  factory :user do
    full_name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password
    role :user
  end

  factory :admin, class: User do
    full_name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password
    role :admin
  end
end
