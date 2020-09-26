class Message < ApplicationRecord
  belongs_to :room
  validates :content, :id_user, presence: true
end
