FactoryBot.define do
  factory :item do
    name                  { Faker::Name.name }
    explanation           { 'explanation-text' }
    price                 { 1000 }
    category_id           { 2 }
    condition_id          { 2 }
    shipping_cost_id      { 2 }
    prefecture_id         { 2 }
    estimated_shipping_id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
