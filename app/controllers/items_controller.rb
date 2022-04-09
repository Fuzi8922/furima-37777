class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :explanation, :price, :category_id, :condition_id, :prefecture_id, :estimated_shipping_id, :user, :shipping_cost_id)
  end

end
