class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :prefecture_id, :days_delivery_id, :delivery_cost_id, :image).merge(user_id: current_user.id)
  end
end
