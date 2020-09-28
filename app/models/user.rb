class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name_kana, format: { with: /\A[ァ-ン]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/ }

  has_many :favorites, dependent: :destroy
  has_many :farms, through: :favorites, dependent: :destroy
  has_many :rooms
  has_many :orders, dependent: :destroy

  def already_favorite?(farm)
    self.favorites.exists?(farm_id: farm.id)
  end
end
