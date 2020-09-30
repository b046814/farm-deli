require 'rails_helper'

RSpec.describe "メッセージ投稿機能", type: :system do
  before do
    @room = FactoryBot.create(:room)
    @room.farmer.farm = FactoryBot.create(:farm, farmer_id: @room.farmer.id)
  end

  context '投稿に失敗した時' do
    it '送る値が空の為、メッセージの送信に失敗すること(消費者)' do
      # 消費者としてログイン
      sign_in_user(@room.user)
      # チャットルームへ移動
      visit room_path(@room)
      # メッセージを入力しない状態で送信ボタンを押下し、メッセージの数が変わっていないことを確認
      expect{
        find('input[name="commit"]').click 
      }.not_to change { Message.count }
      # チャットルームにいることを確認
      expect(current_path).to eq room_path(@room)
    end

    it '送る値が空の為、メッセージの送信に失敗すること(生産者)' do
      # 消費者としてログイン
      sign_in_farmer(@room.farmer)
      # チャットルームへ移動
      visit room_path(@room)
      # メッセージを入力しない状態で送信ボタンを押下し、メッセージの数が変わっていないことを確認
      expect{
        find('input[name="commit"]').click 
      }.not_to change { Message.count }
      # チャットルームにいることを確認
      expect(current_path).to eq room_path(@room)
    end
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている(消費者)' do
      sign_in_user(@room.user)
      visit room_path(@room)
      post = "test"
      fill_in 'message_content', with: post
      expect{
      find('input[name="commit"]').click 
      }.to change { Message.count }.by(1)
      expect(current_path).to eq room_path(@room)
      expect(page).to have_content(post)
    end

    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている(生産者)' do
      sign_in_farmer(@room.farmer)
      visit room_path(@room)
      post = "test"
      fill_in 'message_content', with: post
      expect{
      find('input[name="commit"]').click 
      }.to change { Message.count }.by(1)
      expect(current_path).to eq room_path(@room)
      expect(page).to have_content(post)
    end
  end

end
