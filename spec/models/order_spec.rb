require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @order = FactoryBot.build(:order, user_id: @user.id, product_id: @product.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品を購入できる時' do
      it 'すべての情報が正しく入力されていれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名がnilでも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
      it '電話番号が10桁でも購入できる' do
        @order.tel = '0331111222'
        expect(@order).to be_valid
      end
    end
    context '商品を購入できない時' do
      it 'postal_codeがnulでは登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが全角では登録できない' do
        @order.postal_code = '１２３−４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeにハイフン無しでは登録できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefectures_idが--(1)では登録できない' do
        @order.prefectures_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it 'municipalitiesがnilでは登録できない' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressがnilでは登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'telがnilでは登録できない' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが全角では登録できない' do
        @order.tel = '１２３４５６７８９０１'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが10桁以内では登録できない' do
        @order.tel = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが11桁以上では登録できない' do
        @order.tel = '1234567890123'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが英数字混合では登録できない' do
        @order.tel = 'aZ23456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenがnilでは登録できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがnilでは登録できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idがnilでは登録できない' do
        @order.product_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
