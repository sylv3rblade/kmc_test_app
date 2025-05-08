FactoryBot.define do
  factory :payout do
    amount { Faker::Commerce.price(range: 10.0..1000.0) }
    status { 'pending' }
  end
end