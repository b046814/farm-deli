require 'rails_helper'

RSpec.describe User, type: :system do

  it 'ログインに成功し、トップページへ遷移する' do
    # 予め、ユーザーをDBへ保存する
    @user = FactoryBot.create(:user)
    # サインインページへ移動する
    visit new_user_session_path
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    # ログインボタンをクリックする
    click_on('Log in')
    #トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
     # サインインページへ移動する
     visit new_user_session_path
    # 誤ったユーザー情報を入力する
    fill_in 'user_email', with: 'test'
    fill_in 'user_password', with: 'test123'
    # ログインボタンをクリックする
    click_on('Log in')
    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq new_user_session_path
  end

end
