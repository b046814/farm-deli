class Item < ApplicationRecord
  belongs_to :farmer

  validates :name, :description, :ship_expense_id, :prefecture_id, :period_id, :price, presence: true
  validates :ship_expense_id, :prefecture_id, :period_id, numericality: { other_than: 1 }
  validates :name, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナで入力して下さい' }
  
end
