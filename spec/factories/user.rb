FactoryBot.define do
  factory :user do
    nickname { 'abe' }
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name { '阿部' }
    first_name { '太郎' }
    failyname_reading { 'アベ' }
    firstname_reading { 'タロウ' }
    birthday_year { 1 }
    birthday_month { 1 }
    birthday_date { 1 }
  end
end