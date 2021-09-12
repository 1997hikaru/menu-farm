class MenusController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_menu, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = @menu.user
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to menu_path
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to root_path
  end

  private
  def menu_params
    params.require(:menu).permit(:recipe_title, :ingredients_list, :step, :point, :category_id, :menu_category_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user == @menu.user
  end

  def find_menu
    @menu = Menu.find(params[:id])
  end
end