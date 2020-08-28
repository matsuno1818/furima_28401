FactoryBot.define do
  factory :user do
    nickname { Faker::Food.fruits }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { '阿部' }
    first_name { '太郎' }
    familyname_reading { 'アベ' }
    firstname_reading { 'タロウ' }
    birthday { '1931-01-01' }
  end
end
