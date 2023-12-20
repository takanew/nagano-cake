class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path(@item)
    else
      render:new
    end
  end

  def show
  end

end



private

def item_params
  params.require(:item).permit(:name, :introduction, :price)
end