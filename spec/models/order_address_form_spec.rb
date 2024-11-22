require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item, user: user)
    @order_address_form = FactoryBot.build(:order_address_form, user_id: user.id, item_id: item.id)
  end

  describe '購入者情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
      end
      it '建物の名前が空でも保存できる' do
      end
    end

    context '内容に問題がある場合' do
      it '購入するユーザーが紐づいていないければ登録できない' do
      end
      it '出品で登録された商品が紐づいていないければ登録できない' do
      end
      it '郵便番号が空だと保存できない' do
      end
      it '郵便番号が半角の数字と-(ハイフン）でないと保存できない' do
      end
      it '郵便番号が4桁目に-(ハイフン)を入れないと保存できない' do
      end
      it '郵便番号が8桁じゃないと保存できない' do
      end
      it '都道府県が空だと保存できない' do
      end
      it '都道府県が---だと保存できない' do
      end
      it '市区町村が空だと保存できない' do
      end
      it '番地が空だと保存できない' do
      end
      it '電場番号が空だと保存できない' do
      end
      it '電話番号が１０桁以上１１桁以下じゃないと保存できない' do
      end
      it '電話番号が半角数字以外だと保存できない' do
      end
    end
  end
end