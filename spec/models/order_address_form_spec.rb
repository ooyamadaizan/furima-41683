require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    sleep 0.01
    item = FactoryBot.create(:item, user: user)
    sleep 0.01
    @order_address_form = FactoryBot.build(:order_address_form, user_id: user.id, item_id: item.id)
  end

  describe '購入者情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address_form).to be_valid
      end
      it '建物の名前が空でも保存できる' do
        @order_address_form.building_name = ""
        expect(@order_address_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '購入するユーザーが紐づいていないければ登録できない' do
        @order_address_form.user_id = nil
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("User can't be blank")
      end
      it '出品で登録された商品が紐づいていないければ登録できない' do
        @order_address_form.item_id = nil
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order_address_form.postal_code = ""
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角の数字と-(ハイフン）でないと保存できない' do
        @order_address_form.postal_code = '12345678'
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号が4桁目に-(ハイフン)を入れないと保存できない' do
        @order_address_form.postal_code = '1234-567'
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号が8桁じゃないと保存できない' do
        @order_address_form.postal_code = '123-456'
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が空だと保存できない' do
        @order_address_form.prefecture_id = nil
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が---だと保存できない' do
        @order_address_form.prefecture_id = 1
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @order_address_form.city = ""
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_address_form.address_line = ""
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Address line can't be blank")
      end
      it '電場番号が空だと保存できない' do
        @order_address_form.phone_number = ""
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が１０桁以上１１桁以下じゃないと保存できない' do
        @order_address_form.phone_number = "123456789"
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Phone number too short")
      end
      it '電話番号が半角数字以外だと保存できない' do
        @order_address_form.phone_number = "123456789０"
        @order_address_form.valid
        expect(@order_address_form.errors.full_messages).to include("Phone number is not a number")
      end
    end
  end
end