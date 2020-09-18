class Farm < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :farmer

  validates :name, :description, :feature, :prefecture_id, presence: true
  validates :prefecture_id, numericarity: { other_than: 1 }
end
