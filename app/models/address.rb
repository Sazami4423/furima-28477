class Address < ApplicationRecord
  belongs_to :product_purchase_management, optional: true
end
