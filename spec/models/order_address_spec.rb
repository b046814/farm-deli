require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "注文情報の保存" do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context "注文情報を保存できる時" do
      it "全ての情報が入力されている時は保存できる" do
        expect(@order_address).to be_valid
      end

      it "buildingの情報は空でも保存できること" do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
    end

    context "注文情報を保存できない時" do
      it "tokenが空では保存できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "amountが空では保存できない" do
        @order_address.amount = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Amount can't be blank")
      end

      it "item_countが空では保存できない" do
        @order_address.item_count = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item count can't be blank")
      end

      it 'postal_codeが空では保存できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeの-の前には半角数字3字でなければ保存できない' do
        @order_address.postal_code = '11-2222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeの-の後には半角数字4字でなければ保存できない' do
        @order_address.postal_code = '111-222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idが空では保存できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end

      it 'prefecture_idが1では保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空では保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'block_numberが空では保存できない' do
        @order_address.block_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block number can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
