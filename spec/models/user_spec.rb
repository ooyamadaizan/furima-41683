require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do

      it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる" do
      end

    end

    context '新規登録できない場合' do

      # ニックネームのテストコード
      it "nicknameが空では登録できない" do
        expect(@user).to be_valid
      end

      # メールアドレスのテストコード
      it "emailが空では登録できない" do
        @user.nickname = ''
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testemail.com'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      # パスワードのテストコード
      it "passwordが空では登録できない" do
        @user.password = ''
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a' * 4
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')     
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = 'a' * 130
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      # お名前(全角)のテストコード
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameとlast_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = 'taro'
        @user.last_name = 'yamada'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end

      # お名前カナ(全角)のテストコード
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaとlast_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = 'たろ'
        @user.last_name_kana = 'やまだ'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end

      # 生年月日のテストコード
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end