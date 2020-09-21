require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が出品できる時' do
      it '全ての情報が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない時' do
      it 'nameが空では出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが全角カタカナ以外で入力された場合は登録できない' do
        @item.name = 'とまと'
        @item.valid?
        expect(@item.errors.full_messages).to include("Name 全角カタカナで入力して下さい")
      end

      it 'descriptionが空では出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'ship_expense_idが空では出品できない' do
        @item.ship_expense_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship expense can't be blank")
      end

      it 'ship_expense_idが1の場合は出品できない' do
        @item.ship_expense_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship expense must be other than 1")
      end

      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1の場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'period_idが空では出品できない' do
        @item.period_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Period can't be blank")
      end

      it 'period_idが1の場合は出品できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Period must be other than 1")
      end

      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数字以外で入力された場合は出品できない' do
        @item.price = '４０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが100未満では出品できない' do
        @item.price = 90
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 100")
      end

      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'farmerが紐づいていないと出品できない' do
        @item.farmer = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Farmer must exist")
      end

    end
  end
end
