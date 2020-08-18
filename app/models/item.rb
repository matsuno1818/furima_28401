class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # with_options presence: true do
  #   validates :image, :name, :text, :genre, :state, :delivery, :prefecture, :shipment, :price
  # end
end 