FactoryBot.define do
  factory :item do
    name { 'ダイコン' }
    description { Faker::Lorem.sentence }
    ship_expense_id { '2' }
    prefecture_id { '37' }
    period_id { '3' }
    price { '9999' }
    association :farmer
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png' )
    end
  end
end
