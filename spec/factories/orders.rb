FactoryBot.define do
  factory :order do
    postal_code                     {'100-8929'}
    prefectures_id                  {'14'}
    municipalities                  {'千代田区霞が関2丁目'}
    address                         {'1-1'}
    building_name                   {'ビル'}
    tel                             {'03358143211'}
    token                           { 'tok_awsedrftgyhuji123' }
    association :user
    association :product
  end
end
