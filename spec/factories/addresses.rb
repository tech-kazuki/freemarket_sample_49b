FactoryBot.define do
  factory :address do
    postal_code           {Faker::Number.number(7)}
    city                  {Faker::Address.city}
    prefecture_id         {Faker::Number.number(1)}
  end
end
