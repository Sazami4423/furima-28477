class Order
  include ActiveModel::Model
  # tokenの値を取り扱えるようにする
  attr_accessor :token, :postal_code, :prefectures_id, :municipalities, :address, :building_name, :tel, :user_id, :product_id

  # バリテーション
  with_options presence: true do
    validates :municipalities
    validates :address
    validates :token
    validates :user_id
    validates :product_id
  end

  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefectures_id, numericality: { other_than: 1 }
  validates :tel, format: { with: /\A\d{10,11}\z/ }

  def save
    ProductPurchaseManagement.create(user_id: user_id, product_id: product_id)
    product_purchase_management = ProductPurchaseManagement.find_by(product_id: product_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address,
                   building_name: building_name, tel: tel, product_purchase_management_id: product_purchase_management.id)
  end
end
