class Product < ApplicationRecord
  # ActiveHashアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_fee
  belongs_to :prefectures
  belongs_to :days

  # 空の投稿を保存できないようにする
  validates :image, :title, :description_text, presence: true

  # priceのバリテーション
  validate :price_tax

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :product_status_id
    validates :shipping_fee_id
    validates :prefectures_id
    validates :days_id
  end

  # モデル間アソシエーション
  belongs_to :user
  has_one_attached :image

  has_one :product_purchase_management

  def price_tax
    if price.blank?
      errors[:base] << "Price can't be blank"
    elsif price < 300
      errors[:base] << 'Please enter a Price of 300 or more'
    elsif price > 9_999_999
      errors[:base] << 'Please enter Price within 9,999,999'
    end
  end
end
