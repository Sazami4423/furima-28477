class Product < ApplicationRecord
  belongs_to :user
  # has_one :product_purchase_management
end
