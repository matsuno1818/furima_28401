FactoryBot.define do
  factory :item do
    text {'美味しいチーズケーキ'}
    name  { 'ケーキ' }
    genre { 1 }
    state { 1 }
    delivery { 1 }
    prefecture { 1 }
    shipment { 1 }
    price { 1000 }
    association :user

  end
end

