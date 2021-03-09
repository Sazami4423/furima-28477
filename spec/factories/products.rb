FactoryBot.define do
  factory :product do
    title                   { Faker::Games::Pokemon.name }
    description_text        { "商品a-Z@:!" }
    category_id             { 3 }
    product_status_id       { 4 }
    shipping_fee_id         { 2 }
    prefectures_id          { 44 }
    days_id                 { 2 }
    price                   { 456825 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.png'), filename: 'test_image.png')
    end
  end
end
