FactoryBot.define do
  factory :item do
    association :user
    name { 'カバン' }
    price { '6000' }
    detail { '最高です' }
    category_id { 2 }
    status_id { 2 }
    shipment_source_id { 2 }
    delivery_charge_id { 2 }
    period_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
