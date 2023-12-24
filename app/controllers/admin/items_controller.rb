class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render:new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page])
  end

end



private

def item_params
  params.require(:item).permit(:name, :introduction, :price, :item_image)
end