class Farmer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

attr_accessor :organic
validates_acceptance_of :organic, allow_nil: false, on: :create, message: '有機農産物のみの販売に同意が必要です'
validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: { message:'入力が必要です'}
validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message:'半角数字と英字の両方を入力して下さい' }
validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message:'全角ひらがな、カタカナ、漢字を入力して下さい' }
validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message:'全角ひらがな、カタカナ、漢字を入力して下さい' }
validates :last_name_kana, format: { with: /\A[ァ-ン]+\z/, message:'全角カタカナを入力して下さい' }
validates :last_name_kana, format: { with: /\A[ァ-ン]+\z/, message:'全角カタカナを入力して下さい' }

end
