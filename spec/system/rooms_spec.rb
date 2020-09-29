require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    @room = FactoryBot.create(:room)
    @room.farmer.farm = FactoryBot.create(:farm, farmer_id: @room.farmer.id)
  end

  it 'チャットルームを削除すると、関連するメッセージが全て削除される' do
    sign_in_user(@room.user)
    visit room_path(@room)
    FactoryBot.create_list(:message, 5, room_id: @room.id)
    expect{
      find_link("チャットを削除する", href: room_path(@room)).click
    }.to change { @room.messages.count }.by(-5)
    expect(current_path).to eq root_path
  end
end
