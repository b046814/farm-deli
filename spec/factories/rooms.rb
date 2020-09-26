FactoryBot.define do
  factory :room do
    association :user
    association :farmer
  end
end
