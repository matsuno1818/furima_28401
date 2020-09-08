class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipment
  has_many_attached :images

  belongs_to :user
  has_one :order

  @half_width_number = /\A[a-z]+\z/
  
  with_options presence: true do
    validates :image, :name, :text
    validates :genre_id, :state_id, :delivery_id, :prefecture_id, :shipment_id
    validates :price, numericality: { greater_than_or_equal_to: 300, message: "の範囲外です" }
    validates :price, numericality: { less_than_or_equal_to: 9999999, messsage: "価格は9999999以下の値にしてください" }
    validates :price, format: {with: @half_width_number, message: "Price Half-width number"}
  end
end 