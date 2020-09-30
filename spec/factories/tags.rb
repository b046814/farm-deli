FactoryBot.define do
  factory :tag do
    text { Faker::Team.name }
  end
end
