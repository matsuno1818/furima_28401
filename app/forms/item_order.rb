class ItemOrder

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  Include_hyphen = /\A\d{3}[-]\d{4}\z/
  Phone_number = /\A\d{11}\z/

  with_options presence: true do
    validates :prefecture_id, :city, :house_number, :token
    validates :postal_code, format: {with: Include_hyphen, message: "にハイフンを入れて入力してくださ"}
    validates :phone_number, format: {with: Phone_number, message: "は11桁で入力してください"}
  end
  
  def save
    # クレジットの情報を保存
    order = Order.create( user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

