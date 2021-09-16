class MenusController < ApplicationController
  def create
    menu = Menu.create(menu_params)
    redirect_to "/items/#{menu.item.id}"
  end

  def new
    @menu = Menu.new
    @item = Item.find(params[:item_id])
    @menus = @item.menus.includes(:user)
  end

  private
  def menu_params
    params.require(:menu).permit(:recipe_title, :ingredients_list, :step, :point, :category_id, :menu_category_id, :image).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end