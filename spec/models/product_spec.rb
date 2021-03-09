require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product) # userインスタンス生成
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it '画像、商品名、商品の説明、カテゴリ、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格があれば商品を登録できる' do
        expect(@product).to be_valid
      end
    end

    context '商品を出品できない時' do
      it 'imageがnullでは登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleがnullでは登録できない' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end
      it 'description_textがnullでは登録できない' do
        @product.description_text = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description text can't be blank")
      end
      it 'category_idが--では登録できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it 'product_status_idが--(1)では登録できない' do
        @product.product_status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status must be other than 1")
      end
      it 'shipping_fee_idが--(1)では登録できない' do
        @product.shipping_fee_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it 'prefectures_idが--(1)では登録できない' do
        @product.prefectures_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it 'days_idが--(1)では登録できない' do
        @product.days_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Days must be other than 1")
      end
    end

    context 'price関連' do
      it 'priceがnullでは登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceに文字列を入力したら登録できない' do
        @product.price = 'あいうえお'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter a Price of 300 or more")
      end
      it 'priceに全角英字を入力したら登録できない' do
        @product.price = 'ABCDEFG'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter a Price of 300 or more")
      end
      it 'priceに半角英字を入力したら登録できない' do
        @product.price = 'abcdefg'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter a Price of 300 or more")
      end
      it 'priceに全角数字を入力したら登録できない' do
        @product.price = '１２３４５６７８９'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter a Price of 300 or more")
      end
      it 'priceに文字列と半角数字を入力したら登録できない' do
        @product.price = 'あいうえお5000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter a Price of 300 or more")
      end
      it 'priceに全角半角混合数字を入力したら登録できない' do
        @product.price = '５００500'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter a Price of 300 or more")
      end
      it 'priceに英字半角混合数字を入力したら登録できない' do
        @product.price = 'ABCD500'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter a Price of 300 or more")
      end
      it 'priceに半角英字半角混合数字を入力したら登録できない' do
        @product.price = 'abcd500'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter a Price of 300 or more")
      end
      it 'priceが300円以下だと登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter a Price of 300 or more")
      end
      it 'priceが9,999,999円以上だと登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Please enter Price within 9,999,999")
      end
    end
  end
end
