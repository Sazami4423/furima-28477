class Order < ApplicationRecord
  # tokenの値を取り扱えるようにする
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :municipalities, :address, :building_name, :tel, :user_id, :product_id

  # アソシエーション
  belongs_to :product_purchase_management, optional: true

  # バリテーション
  with_options presence: true do
    validates :municipalities
    validates :address
    validates :token
  end

  validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :prefectures_id, numericality: { other_than: 1 }
  validates :tel, format: {with:/\A\d{11}\z/}

  def save
    ProductPurchaseManagement.create(user_id: user_id, product_id: product_id)
    product_purchase_management = ProductPurchaseManagement.find_by(product_id: product_id)
    Order.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building_name: building_name, tel: tel, product_purchase_management_id: product_purchase_management.product_id)
  end
end
