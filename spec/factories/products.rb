FactoryBot.define do
  factory :product do
    name          {Faker::Name.name}
    price         {Faker::Number.number(5)}
    description   {Faker::Lorem.sentence}
    product_state {Faker::Lorem.word}
    burden        {Faker::Lorem.word}
    size          {Faker::Lorem.word}
    prefecture_id {Faker::Number.number(1)}
    how_long      {Faker::Lorem.word}
    how_ship      {Faker::Lorem.word}
    brand         {Faker::Lorem.word}
    availability  {Faker::Lorem.word}
  end
end

