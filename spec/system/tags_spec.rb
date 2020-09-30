require 'rails_helper'

RSpec.describe "タグ付機能", type: :system do
  before do
    @farm_tag = FactoryBot.create(:farm_tag)
  end

  it 'タグ付された農園は、トップページでタグ名をクリックすることで一覧表示できる' do
    visit root_path
    find_link("#{@farm_tag.tag.text}生産農園", href: tag_path(@farm_tag.tag)).click
    expect(current_path).to eq tag_path(@farm_tag.tag)
    expect(page).to have_content(@farm_tag.farm.name)
  end
end
