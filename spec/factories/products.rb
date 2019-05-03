FactoryBot.define do
  factory :product do
    name          {Faker::Name.name}
    price         {Faker::Number.number(10)}
    description   {Faker::Lorem.sentence}
    category_id   {Faker::Number.number(1)}
    product_state {Faker::Lorem.word}
    burden        {Faker::Lorem.word}
    size          {Faker::Lorem.word}
    prefecture_id {Faker::Number.number(1)}
    how_long      {Faker::Lorem.word}
    how_ship      {Faker::Lorem.word}
    brand         {Faker::Number.number(1)}
    availability  {Faker::Lorem.word}
    user_id       {Faker::Number.number(1)}
  end
end

