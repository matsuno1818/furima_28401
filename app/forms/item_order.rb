class ItemOrder

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  @Include_hyphen = /\A[0-9]{3}-[0-9]{4}\z/
  @half_width_number = /\A[a-z]+\z/

  with_options presence: true do
    validates :prefecture_id, :city, :house_number
    validates :postal_code, format: {with: @Include_hyphen, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with:  @half_width_number, message: "Price Half-width number"}
  end
  
  def save
    # クレジットの情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

