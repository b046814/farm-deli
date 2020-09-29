require 'rails_helper'

RSpec.describe "Farmers", type: :system do

  it 'ログインに成功し、トップページへ遷移する' do
    # 予め、ユーザーをDBへ保存する
    @farmer = FactoryBot.create(:farmer)
    # サインインページへ移動する
    visit new_farmer_session_path
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in "farmer_email", with: @farmer.email
    fill_in "farmer_password", with: @farmer.password
    # ログインボタンをクリックする
    click_on('Log in')
    #トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @farmer = FactoryBot.create(:farmer)
     # サインインページへ移動する
     visit new_farmer_session_path
    # 誤ったユーザー情報を入力する
    fill_in 'farmer_email', with: 'test'
    fill_in 'farmer_password', with: 'test123'
    # ログインボタンをクリックする
    click_on('Log in')
    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq new_farmer_session_path
  end

end