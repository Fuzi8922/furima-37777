class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  private

  def order_params
    params.require(:order).permit().merge(item_id: @item.id)
  end

end