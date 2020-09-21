class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :farmer
  has_one_attached :image
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :period
  belongs_to_active_hash :ship_expense

  validates :name, :image, :description, :ship_expense_id, :prefecture_id, :period_id, :price, presence: true
  validates :ship_expense_id, :prefecture_id, :period_id, numericality: { other_than: 1 }
  validates :name, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナで入力して下さい' }

end
