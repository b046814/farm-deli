class Farm < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :farmer
  has_many_attached :images

  validates :name, :images, :description, :feature, :prefecture_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
end
