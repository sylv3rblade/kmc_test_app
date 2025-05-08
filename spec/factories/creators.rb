FactoryBot.define do
  factory :creator do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    status { 'active' }
  end
end
