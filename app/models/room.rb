class Room < ApplicationRecord
  validates :user_id, uniqueness: {scope: :farmer_id}

  belongs_to :user
  belongs_to :farmer
  has_many :messages, dependent: :destroy
end
