require 'rails_helper'

RSpec.describe "商品購入機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @farm = FactoryBot.create(:farm, farmer_id: @item.farmer.id)
  end

  it '必要な情報を入力すれば商品が購入できる' do
    sign_in_user(@user)
    find_link(@item.description, href: item_path(@item)).click
    number = 2
    fill_in 'count', with: number
    find('input[name="commit"]').click
    expect(current_path).to eq new_item_order_path(@item)
    fill_in 'card-number', with: 4242424242424242
    fill_in 'card-cvc', with: 123
    fill_in 'card-exp-month', with: 12
    fill_in 'card-exp-year', with: 24
    fill_in 'order_address_postal_code', with: '111-2222'
    select '東京都', from: 'order_address_prefecture_id'
    fill_in 'order_address_city', with: '山田市山田町'
    fill_in 'order_address_block_number', with: '1-2-3'
    fill_in 'order_address_building', with: 'ファクト303号室'
    fill_in 'order_address_phone_number', with: '11122223333'
    find('input[name="commit"]').click
    binding.pry
    click_on('マイページ')
    expect(page).to have_content(@item.description)
    expect(page).to have_content(@item.farmer.farm.name)
  end
end
