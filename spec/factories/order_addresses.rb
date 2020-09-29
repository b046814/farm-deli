FactoryBot.define do
  factory :order_address do
    token  { Faker::Lorem.sentence }
    amount { 7000 }
    item_count { 4 }
    postal_code { "123-4567" }
    prefecture_id { 35 }
    city { "春日部市春日部町" }
    block_number { "1-2-3" }
    building { "ファクト505号室" }
    phone_number { 11122223333 }
  end
end
