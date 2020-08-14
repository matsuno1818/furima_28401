class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, format: { with: /\A[a-z0-9]+\z{6,}/i }
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :familyname_reading, :firstname_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
