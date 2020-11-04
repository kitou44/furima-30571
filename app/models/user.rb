class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, uniqueness: true 
  
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/} 
  
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
  
  validates :family_name, format: { with: /\A[一-龥]+\z/}
  
  validates :first_name, format: { with: /\A[一-龥]+\z/}
  
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  


  validates :nickname, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
end
