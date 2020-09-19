FactoryBot.define do
  factory :farm do
    name { Faker::Team.name }
    prefecture_id { 23 }
    description { Faker::Lorem.sentence }
    feature { Faker::Lorem.sentence }
    association :farmer

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
