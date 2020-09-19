require 'rails_helper'

RSpec.describe Farm, type: :model do
  describe '#create' do
    before do
      @farm = FactoryBot.build(:farm)
    end

    context 'Farmの登録ができる時' do
      it '全ての情報が入力されている場合は登録できる' do
        expect(@farm).to be_valid
      end
    end

    context 'Farmの登録ができない時' do
      it 'nameが無い場合は登録できない' do
        @farm.name = nil
        @farm.valid?
        expect(@farm.errors.full_messages).to include("Name can't be blank")
      end

      it 'prefecture_idが無い場合は登録できない' do
        @farm.prefecture_id = nil
        @farm.valid?
        expect(@farm.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end

      it 'prefecture_idが1の場合は登録できない' do
        @farm.prefecture_id = 1
        @farm.valid?
        expect(@farm.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'descriptionが無い場合は登録できない' do
        @farm.description = nil
        @farm.valid?
        expect(@farm.errors.full_messages).to include("Description can't be blank")
      end

      it 'featureが無い場合は登録できない' do
        @farm.feature = nil
        @farm.valid?
        expect(@farm.errors.full_messages).to include("Feature can't be blank")
      end

      it '関連するfarmerが存在しない場合は登録できない' do
        @farm.farmer = nil
        @farm.valid?
        expect(@farm.errors.full_messages).to include("Farmer must exist")
      end

      it 'farmer_idが重複する場合は登録できない' do
        @farm.save
        another_farm = FactoryBot.build(:farm)
        another_farm.farmer_id = @farm.farmer_id
        another_farm.valid?
        expect(another_farm.errors.full_messages).to include("Farmer has already been taken")
      end

      it '画像が無い場合は登録できない' do
        @farm.images = nil
        @farm.valid?
        expect(@farm.errors.full_messages).to include("Images can't be blank")
      end
    end
  end
end
