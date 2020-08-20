class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  @half_width_number = /\A[a-z]+\z/


  with_options presence: true do
    validates :image, :name, :text, :genre, :state, :delivery, :prefecture, :shipment
    validates :price, numericality: { greater_than_or_equal_to: 300, message: "Price Out of setting range" }
    validates :price, numericality: { less_than_or_equal_to: 9999999, messsage: "Price Out of setting range" }
    validates :price, format: {with: @half_width_number, message: "Price Half-width number"}
  end
end 