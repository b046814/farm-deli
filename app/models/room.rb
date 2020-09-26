class Room < ApplicationRecord
  belongs_to :user
  belongs_to :farmer
  has_many :messages
end
