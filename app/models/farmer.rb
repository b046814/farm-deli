class Farmer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

attr_accessor :organic
validates_acceptance_of :organic, allow_nil: false, on: :create, message: '有機農産物のみの販売に同意が必要です'
validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
validates :last_name_kana, format: { with: /\A[ァ-ン]+\z/ }
validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/ }

has_one :farm
has_many :items
end
