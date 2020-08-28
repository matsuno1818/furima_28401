FactoryBot.define do
  factory :item_order do
    postal_code     { '123-4567' }
    prefecture_id   { 3 }
    city            {Faker::Address.city}
    house_number    {Faker::Address.time_zone}
    building_name   {Faker::Address.country}
    phone_number    {Faker::PhoneNumber.subscriber_number(length: 11)}
    token           { 'PSG' }
  end
end
