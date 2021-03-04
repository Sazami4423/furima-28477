require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) # userインスタンス生成
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき' do
      it 'nickname,email,password,password_confirmation,surname,name,surname_kana,name_kana,birthdayがあれば登録ができる' do
        expect(@user).to be_valid
      end
      it 'password_confirmationが6文字以上、英数字混合なら登録できる' do
        @user.password = 'a000000'
        @user.password_confirmation = 'a000000'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できないとき' do
      it 'nicknameがnullでは登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailがnullでは登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@を含む必要があること' do
        @user.email = 'mailaddress'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードがnullでは登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password is invalid',
                                                      'Password confirmation is invalid')
      end
      it 'パスワードが半角英字のみでは登録できない' do
        @user.password = 'qawsedrftgyhujikolp'
        @user.password_confirmation = 'qawsedrftgyhujikolp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid', 'Password confirmation is invalid')
      end
      it 'パスワードが半角数字のみでは登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid', 'Password confirmation is invalid')
      end
      it 'パスワードが全角では登録できない' do
        @user.password = 'ＡＢ３７５６４'
        @user.password_confirmation = 'ＡＢ３７５６４'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid', 'Password confirmation is invalid')
      end
      it '確認用パスワードがnullでは登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      "Password confirmation can't be blank", 'Password confirmation is invalid')
      end
      it '確認用パスワードがパスワードと同じでなければ登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'surnameがnullでは登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
      it 'surnameが全角漢字、かな、カナでなければ登録できない' do
        @user.surname = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname is invalid. Input full-width characters.')
      end
      it 'nameがnullでは登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが全角漢字、かな、カナでなければ登録できない' do
        @user.name = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid. Input full-width characters.')
      end
      it 'surname_kanaがnullでは登録できない' do
        @user.surname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana can't be blank",
                                                      'Surname kana is invalid. Input full-width katakana characters.')
      end
      it 'surname_kanaがカナでなければ登録できない' do
        @user.surname_kana = '徳川'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname kana is invalid. Input full-width katakana characters.')
      end
      it 'name_kanaがnullでは登録できない' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank",
                                                      'Name kana is invalid. Input full-width katakana characters.')
      end
      it 'name_kanaがカナでなければ登録できない' do
        @user.name_kana = '茂茂'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana is invalid. Input full-width katakana characters.')
      end
      it '生年月日がnullでは登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
