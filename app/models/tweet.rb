class Tweet < ApplicationRecord
  validates :content, :image, presence: true

  belongs_to :farm
  has_one_attached :image
end
