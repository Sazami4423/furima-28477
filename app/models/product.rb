class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  #画像保存の実装時は該当コントローラーにストロングパラメータを記載
  # has_one :product_purchase_management
end
