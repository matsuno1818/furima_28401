class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # @minimum_price = 300
  # @maximum_price = 9999999
  @half_width_number = /\A[a-z]+\z/


  with_options presence: true do
    validates :image, :name, :text, :genre, :state, :delivery, :prefecture, :shipment
    validates :price, numericality: { greater_than_or_equal_to: 300, message: "Price Out of setting range" }
    validates :price, numericality: { less_than_or_equal_to: 9999999, messsage: "Price Out of setting range" }
    validates :price, format: {with: @half_width_number, message: "Price Half-width number"}
  
  #   # メッセージを直書きした場合
  # validates :name, presence: { message: "must be given please" }

  # # 動的な属性値を含むメッセージの場合。%{value}は実際の属性値に
  # # 置き換えられる。%{attribute}や%{model}も利用可能。
  # validates :age, numericality: { message: "%{value} seems wrong" }
  end
end 