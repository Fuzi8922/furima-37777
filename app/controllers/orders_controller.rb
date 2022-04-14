class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    item_identify
    if @item.order.nil? && (@item.user_id != current_user.id)
      @order_address = OrderAddress.new
    else
      redirect_to items_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.user_id == current_user.id
      if @order_address.valid?
        pay_item
        @order_address.save
        redirect_to root_path
      else
        item_identify
        render :index
      end
    else
      redirect_to items_path
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :post_code, :prefecture_id, :municipalities, :address, :building_address, :phone_number
    ).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    item_identify
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_identify
    @item = Item.find(params[:item_id])
  end

end
