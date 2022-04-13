FactoryBot.define do
  factory :order_address do
    token            { 'token_asdfghjkl0000000000' }
    post_code        { '123-4567' }
    prefecture_id    { 1 }
    municipalities   { 'city' }
    address          { '1-1' }
    building_address { '11' }
    phone_number     { 11_122_223_333 }
    user_id          { 1 }
    item_id          { 1 }
  end
end
