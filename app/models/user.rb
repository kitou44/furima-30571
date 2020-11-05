class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, uniqueness: true 
  
  validates :family_name_kana,:first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/} 
  
  validates :family_name, :first_name,format: { with: /\A[一-龥]+\z/}
  validates :family_name, :first_name,format: { with:/\A[ぁ-んー－]+\z/}
  validates :family_name, :first_name,format: { with:/\A[ァ-ヶー－]+\z/}
  validates :family_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 
  validates :first_name_kana,  presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } 


  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  
  validates :password, format: { with:/(?=.*\d+.*)(?=.*[a-zA-Z]+.*).*[!@#$%]+.*/}
  validates :password,  presence: true, length: { minimum: 6 } 
 
  validates :nickname, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  validates :nickname, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday,allow_blank: true
end
