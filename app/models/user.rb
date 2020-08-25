class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_one :order

    @nickname = /\A[ぁ-んァ-ン一-龥a-z0-9]+\z/i 
    @email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    @password = /\A[a-z0-9]+\z{6,}/i
    @zenkaku = /\A[ぁ-んァ-ン一-龥]/
    @zenkakukana = /\A[ァ-ヶー－]+\z/
  

  with_options presence: true do
    validates :nickname, uniqueness: true, format: { with: @nickname }
    validates :email, uniqueness: true, format: { with: @email }
    validates :password, format: { with: @password, message: "Password Include both letters and numbers" }
    validates :family_name, :first_name, format: { with: @zenkaku, message: "Full-width characters" }
    validates :familyname_reading, :firstname_reading, format: { with: @zenkakukana, message: " Full-width katakana characters" }
    validates :birthday
  end
end
