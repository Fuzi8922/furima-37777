class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :estimated_shipping
  belongs_to :shipping_cost

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :estimated_shipping_id
  end

  with_options format: { with: /\A[0-9]+\z/ }, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :estimated_shipping_id
  end

  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { in: 300..9_999_999, only_integer: true }
end
