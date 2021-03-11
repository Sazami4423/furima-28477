class Order < ApplicationRecord

  # tokenの値を取り扱えるようにする
  attr_accessor :token

  # アソシエーション
  belongs_to :product_purchase_management

  # バリテーション
  validates :prefectures_id, numericality: { other_than: 1 }
  with_options  presence: true do
    validates :postal_code
    validates :municipalities 
    validates :address
    validates :tel
  end
end
