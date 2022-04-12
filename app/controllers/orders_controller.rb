class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(
      :post_code, :prefecture_id, :municipalities, :address, :building_address, :phone_number, :item_id, :user_id).merge(
        token: params[:token]
      )
  end

end