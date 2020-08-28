FactoryBot.define do
  factory :item do
    text {'美味しいチーズケーキ'}
    name  { 'ケーキ' }
    genre_id { 1 }
    state_id { 1 }
    delivery_id { 1 }
    prefecture_id { 1 }
    shipment_id { 1 }
    price { 1000 }
    association :user

  end
end

