require 'rails_helper'

RSpec.describe "タグ付機能", type: :system do
  before do
    # farmとtagが同時に生成される
    @farm_tag = FactoryBot.create(:farm_tag)
  end

  it 'タグ付された農園は、トップページでタグ名をクリックすることで一覧表示できる' do
    # トップページへ移動
    visit root_path
    # タグの名前のリンクをクリック
    find_link("#{@farm_tag.tag.text}生産農園", href: tag_path(@farm_tag.tag)).click
    # タグを持つ農園一覧ページへ移動
    expect(current_path).to eq tag_path(@farm_tag.tag)
    # タグを持つ農園が表示されていることを確認
    expect(page).to have_content(@farm_tag.farm.name)
  end
end
