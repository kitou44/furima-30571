class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # validates :nickname, uniqueness: true 
  
  #validates :family_name, :first_name,format: { with: /\A[一-龥]+\z/}
  
 # with_options presence: true,format: { with:/\A[ぁ-んァ-ン一-龥]/} do
 # validates :family_name
 # validates :first_name
 #end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/} do
    validates :family_name_kana
    validates :family_name_kana
    validates :family_name
    validates :first_name
 end

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  
  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :password,  presence: true, length: { minimum: 6 } 
 
  # validates :nickname, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
end
