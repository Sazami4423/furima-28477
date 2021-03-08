require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product) # userインスタンス生成
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it '画像、商品名、商品の説明、カテゴリ、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格があれば商品を出品できる' do
        # binding.pry
        # expect(@product).to be_valid
      end
    end

    # context '商品を出品できない時' do
    #   it 'nicknameがnullでは登録できない' do
    #     @product.nickname = ''
    #     @product.valid?
    #     expect(@product.errors.full_messages).to include("Nickname can't be blank")
    #   end
    
  end
end
