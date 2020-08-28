class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_one :order

    Nickname = /\A[ぁ-んァ-ン一-龥a-z0-9]+\z/i 
    Email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    Password = /\A[a-z0-9]+\z{6,}/i
    Zenkaku = /\A[ぁ-んァ-ン一-龥]/
    Zenkakukana = /\A[ァ-ヶー－]+\z/
  

  with_options presence: true do
    validates :nickname, uniqueness: true, format: {with: Nickname, message: "Nickname has already been taken" }
    validates :email, uniqueness: true, format: { with: Email, message: "Email has already been taken" }
    validates :password, format: { with: Password, message: "Password Include both letters and numbers" }
    validates :family_name, :first_name, format: { with: Zenkaku, message: "Full-width characters" }
    validates :familyname_reading, :firstname_reading, format: { with: Zenkakukana, message: " Full-width katakana characters" }
    validates :birthday
  end
end
