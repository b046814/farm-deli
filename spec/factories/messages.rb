FactoryBot.define do
  factory :message do
    content { Faker::Lorem.sentence }
    id_user { true }

    association :room
  end
end
