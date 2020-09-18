FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email    { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '川口' }
    first_name { '充' }
    last_name_kana { 'カワグチ' }
    first_name_kana { 'ミツル' }
    birth_date { '1988-09-22' }
  end
end
