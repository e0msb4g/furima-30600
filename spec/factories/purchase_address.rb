FactoryBot.define do
  factory :purchase_address do
    prefecture_id {2}
    city {"岩手"}
    house_number {"青森1-2"}
    post_code {"222-3333"}
    phone_number {1234567890}
    token {"pk_test_1234567890assdfggg"}
  end
end