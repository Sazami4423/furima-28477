class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  # has_one :product_purchase_management
end
