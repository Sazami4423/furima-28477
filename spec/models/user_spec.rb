require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) #userインスタンス生成
  end

 describe 'ユーザー新規登録' do
   context 'ユーザー登録できるとき' do
     it 'nickname,email,password,password_confirmation,surname,name,surname_kana,name_kana,birthdayがあれば登録ができる'do
     expect(@user).to be_valid
     end
     it 'password_confirmationが6文字以上、英数字混合なら登録できる' do
      @user.password = 'a000000'
      @user.password_confirmation = 'a000000'
      expect(@user).to be_valid
     end
    end
   context 'ユーザー登録できないとき' do
     it 'nicknameがnullでは登録できない'do
       @user.nickname = '' 
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailがnullでは登録できない'do
     @user.email = '' 
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'emailが重複する場合は登録できない'do
     @user.save
     another_user = FactoryBot.build(:user)
     another_user.email = @user.email
     another_user.valid?
     expect(another_user.errors.full_messages).to include('Email has already been taken')

     end
     it 'emailが@を含む必要があること'do
    
     end
     it 'パスワードがnullでは登録できない'do
    
     end
     it 'パスワードが6文字以下では登録できない'do
    
     end
     it 'パスワードが英数字混合でなければ登録できない'do
    
     end
     it '確認用パスワードがnullでは登録できない'do
    
     end
     it '確認用パスワードがパスワードと同じでなければ登録できない'do
    
     end
     it 'surnameがnullでは登録できない'do
    
     end
     it 'surnameが全角漢字、かな、カナでなければ登録できない'do
    
     end
     it 'nameがnullでは登録できない'do
    
     end
     it 'nameが全角漢字、かな、カナでなければ登録できない'do
    
     end
     it 'surname_kanaがnullでは登録できない'do
    
     end
     it 'surname_kanaがカナでなければ登録できない'do
    
     end
     it 'name_kanaがnullでは登録できない'do
    
     end
     it 'name_kanaがカナでなければ登録できない'do
    
     end
     it '生年月日がnullでは登録できない'do
    
     end
   end
   context 'ユーザー登録できないとき' do
     it 'ニックネームがnullならエラーメッセージが出る'do
    
     end
     it 'emailがnullならエラーメッセージが出る'do
    
     end
     it 'emailに@が入っていなければエラーメッセージが出る'do
    
     end
     it 'emailが重複していればエラーメッセージが出る'do
    
     end
     it 'パスワードがnullならエラーメッセージが出る'do
    
     end
     it 'パスワードが6文字以下ならエラーメッセージが出る'do
    
     end
     it 'パスワードが英数字混合でなけれエラーメッセージが出る'do
    
     end
     it '確認パスワードがnullならエラーメッセージが出る'do
     
     end
     it '確認パスワードが不一致ならエラーメッセージが出る'do
    
     end
     it '名字がnullエラーメッセージが出る'do
    
     end
     it '名字が漢字、かなカナ以外ならエラーメッセージが出る'do
    
     end
     it '名前がnullならエラーメッセージが出る'do
    
     end
     it '名前が漢字かなカナ以外ならエラーメッセージが出る'do
    
     end
     it '名字カナがnullならエラーメッセージが出る'do
    
     end
     it '名字カナがカナ以外ならエラーメッセージが出る'do
    
     end
     it '名前カナがnullならエラーメッセージが出る'do
    
     end
     it '名前カナがカナ以外ならエラーメッセージが出る'do
    
     end
     it '生年月日がnullならエラーメッセージが出る'do
    
     end
   end

  end
end
