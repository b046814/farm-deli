class Tag < ApplicationRecord
  has_many :farm_tags, dependent: :destroy
  has_many :farms, through: :farm_tags, dependent: :destroy
end
