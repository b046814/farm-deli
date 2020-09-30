require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    @room = FactoryBot.create(:room)
    @room.farmer.farm = FactoryBot.create(:farm, farmer_id: @room.farmer.id)
  end

  it 'チャットルームを削除すると、関連するメッセージが全て削除される' do
    # 消費者でログイン
    sign_in_user(@room.user)
    # チャットルームへ移動
    visit room_path(@room)
    # メッセージを5個作成
    FactoryBot.create_list(:message, 5, room_id: @room.id)
    # チャットを削除するボタンを押すとメッセージが5個減っていることを確認
    expect{
      find_link("チャットを削除する", href: room_path(@room)).click
    }.to change { @room.messages.count }.by(-5)
    # トップページに移動していることを確認
    expect(current_path).to eq root_path
  end
end
