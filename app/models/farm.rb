class Farm < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :farmer
  has_many_attached :images
  has_many :farm_tags, dependent: :destroy
  has_many :tags, through: :farm_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, dependent: :destroy
  
  validates :farmer_id, uniqueness: true
  validates :name, :images, :description, :feature, :prefecture_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:text) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old_text|
      self.tags.delete Tag.find_by(text: old_text)
    end

    new_tags.each do |new_text|
      farm_tag = Tag.find_or_create_by(text: new_text)
      self.tags << farm_tag
    end
  end
end
