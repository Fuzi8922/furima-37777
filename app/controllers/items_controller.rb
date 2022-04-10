class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    #@items = Item.all.order('created_at desc')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :explanation, :image, :price, :category_id, :condition_id, :prefecture_id, :estimated_shipping_id, :user_id, :shipping_cost_id
    ).merge(
      user_id: current_user.id
    )
  end
end
