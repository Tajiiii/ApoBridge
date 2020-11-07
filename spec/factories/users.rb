FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email { Faker::Internet.email }
    postcode { Faker::Address.postcode }
    address { Faker::Address.city }
    company { Faker::Company.name}
    phonenumber {"09000000000"}
    password { 'password' }
    password_confirmation { 'password' }

  end
end