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
  
  def edit
  @item = Item.find(params[:id])
  end
  
  # updateはnewと異なり、既存のレコードを抽出する必要があるため、params[:id]を引数に指定する必要がある。
  def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to admin_item_path(@item)
  else
    render :edit
  end
  end  
  
end



private

def item_params
  params.require(:item).permit(:name, :introduction, :price, :item_image)
end