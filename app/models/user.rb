class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "一意性で@、半角英数字で入力してください。"}
    validates :password, format: { with: /\A[a-z0-9]+\z{6,}/i, message: "半角英数字で６文字以上で入力してください。"}
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    validates :familyname_reading, :firstname_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください。"}
    
  end

end
