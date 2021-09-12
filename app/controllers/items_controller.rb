class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :sold_out_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
    @menus = Menu.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = @item.user
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :prefecture_id, :days_delivery_id, :delivery_cost_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user == @item.user
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def sold_out_item
    redirect_to root_path  if @item.purchase.present?
  end
end
