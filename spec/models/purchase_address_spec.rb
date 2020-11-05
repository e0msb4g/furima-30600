require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @pa = FactoryBot.build(:purchase_address)
  end

  describe '商品の購入' do
    context '商品の購入がうまくいく時' do
      it 'prefecture_id,city,house_number,post_code,phone_numberが存在すれば購入できる' do
        expect(@pa).to be_valid
      end

      it 'post_codeにハイフンが入力されており、前半3字、後半4字の数字であれば購入できる' do
        expect(@pa).to be_valid
      end

      it '電話番号が11桁以内でハイフンがなければ、購入できる' do
        expect(@pa).to be_valid
      end
    end

    context '商品の購入がうまくいかない時' do
      it 'prefecture_idが空だと購入出来ない' do
        @pa.prefecture_id = ""
        @pa.valid?
        expect(@pa.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと購入出来ない' do
        @pa.city = ''
        @pa.valid?
        expect(@pa.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと購入出来ない' do
        @pa.house_number = ''
        @pa.valid?
        expect(@pa.errors.full_messages).to include("House number can't be blank")
      end

      it 'post_codeが空だと購入出来ない' do
        @pa.post_code = ""
        @pa.valid?
        expect(@pa.errors.full_messages).to include("Post code can't be blank")
      end

      it 'phone_numberが空だと購入出来ない' do
        @pa.phone_number = ""
        @pa.valid?
        expect(@pa.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'post_codeにハイフンが入力されないと、購入できない' do
        @pa.post_code = "1111111"
        @pa.valid?
        expect(@pa.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'phone_numberが11桁以内でないと購入できない' do
        @pa.phone_number = 111111111111
        @pa.valid?
        expect(@pa.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'tokenが生成されないと購入できない' do
        @pa.token = nil
        @pa.valid?
        expect(@pa.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end