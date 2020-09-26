require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    
    before do
      @message = FactoryBot.build(:message)
    end

    context 'メッセージを投稿できる時' do
      it '全ての情報が入力されていれば投稿できる' do
        expect(@message).to be_valid
      end
    end

    context 'メッセージを投稿できない時' do
      it 'contentが空では投稿できない' do
        @message.content = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end

      it 'id_userが空では投稿できない' do
        @message.id_user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Id user can't be blank")
      end

      it '紐づくroomが無ければ投稿できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
    end
  end
end
