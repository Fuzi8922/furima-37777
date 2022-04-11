class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :identify_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at desc')
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

  def show
  end

  def edit
    redirect_to action: :index if current_user.id != @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to action: :index
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

  def identify_item
    @item = Item.find(params[:id])
  end
end
