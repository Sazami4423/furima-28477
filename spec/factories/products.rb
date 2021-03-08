FactoryBot.define do
  factory :product do
    image                   { Faker::Lorem.sentence }
    title                   { Faker::Games::Pokemon.name }
    description_text        { "商品a-Z@:!" }
    category_id             { 3 }
    product_status_id       { 4 }
    shipping_fee_id         { 2 }
    prefectures_id          { 44 }
    days_id                 { 2 }
    price                   { 456825 }
    association :user
  end
end
