require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#create' do

    before do
      @room = FactoryBot.build(:room)
    end

    context 'チャットルームを作成できる時' do
      it '紐づくuserとfarmerが存在する時' do
        expect(@room).to be_valid
      end
    end

    context 'チャットルームが作成できない時' do
      it '紐づくuserがいない時' do
        @room.user = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("User must exist")
      end

      it '紐づくfarmerがいない時' do
        @room.farmer = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Farmer must exist")
      end
    end
  end

end
