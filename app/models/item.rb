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
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: { greater_than_or_equal_to: 100 }

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
