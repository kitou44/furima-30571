class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  
  with_options presence: true,format: { with:/\A[ァ-ヶー－]+\z/} do
   validates :family_name_kana
   validates :first_name_kana
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :family_name
    validates :first_name
 end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
  validates :password, presence: true, length: { minimum: 6}, format: { with: VALID_PASSWORD_REGEX}

  #has_many :items_users

  has_many :items
  has_many :order
end
