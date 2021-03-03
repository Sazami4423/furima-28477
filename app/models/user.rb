class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    #ひら、カナ、漢字のみ許可
    validates :surname, :name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters."}
    #カナのみ許可
    validates :surname_kana, :name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    #半角英数字混合のみ許可(6文字以下不可)
    validates :encrypted_password, :password, :password_confirmation, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}

  end
  validates :nickname, presence: true
  validates :birthday, presence: true

  has_many :products
  # has_many :product_purchase_managements


end
