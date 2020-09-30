require 'rails_helper'

RSpec.describe "いいね機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @farm = FactoryBot.create(:farm)
  end

  it '消費者は農園ページでいいねをすることができ、いいねをした農園は消費者のマイページに表示される' do
    # 消費者でログイン
    sign_in_user(@user)
    # 農園紹介ページへ移動
    visit farm_path(@farm)
    # いいねボタンをクリック
    find("#farm_#{@farm.id}").click
    # マイページボタンをクリック
    click_on('マイページ')
    # マイページへ移動していることを確認
    expect(current_path).to eq user_path(@user)
    # マイページにいいねをした農園が表示されていることを確認
    expect(page).to have_content(@farm.name)
  end

  it '消費者は農園ページでいいねをすることができ、いいねを取り消すこともできる' do
    # 消費者でログイン
    sign_in_user(@user)
    # 農園紹介ページへ移動
    visit farm_path(@farm)
    # いいねボタンをクリック
    find(".like-btn").click
    # いいねが1度押されているいいねボタンをクリック
    find(".unlike-btn").click
    # マイページボタンをクリック
    click_on('マイページ')
    # マイページへ移動していることを確認
    expect(current_path).to eq user_path(@user)
    # マイページにいいねをした農園が表示されていないことを確認
    expect(page).to have_no_content(@farm.name)
  end

end
