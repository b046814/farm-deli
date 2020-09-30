FactoryBot.define do
  factory :farm_tag do
    association :farm
    association :tag
    
  end
end
