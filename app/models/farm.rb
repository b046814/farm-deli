class Farm < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :farmer
  has_many_attached :images
  has_many :farm_tags, dependent: :destroy
  has_many :tags, through: :farm_tags, dependent: :destroy
  
  validates :farmer_id, uniqueness: true
  validates :name, :images, :description, :feature, :prefecture_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
end
