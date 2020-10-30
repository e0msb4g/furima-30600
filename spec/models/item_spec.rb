require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品がうまくいく時' do
      it 'nameと、detail、price、category、status、shipment_source、delivery_charge、period、imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'status_id,category_id,shipment_source_id,delivery_charge_id,period_idが１でなければ登録できる' do
        expect(@item).to be_valid
      end
      it 'nameが40字以内、detailが1000文字以内であれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上、9,999,999円以内であれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかない時' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'detailが空だと登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'status_idが１だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end

      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it 'shipment_source_idが1だと登録できない' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source Select")
      end

      it 'delivery_charge_idが1だと登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge Select")
      end

      it 'period_idが1だと登録できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Period Select")
      end

      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '価格が300円より低いと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it '価格が9,999,999円より大きいと出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it '価格は半角数字でないと登録できない' do
        @item.price = "１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
