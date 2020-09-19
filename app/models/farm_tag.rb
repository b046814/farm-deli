class FarmTag < ApplicationRecord
  belongs_to :farm
  belongs_to :tag
end
