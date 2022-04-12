class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_address, :phone_number, :order, :user_id, :item_id
  attr_accessor :token

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_address: building_address, phone_number: phone_number)
  end
end