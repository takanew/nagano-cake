class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @customer = current_customer
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    if @order.valid?
      redirect_to confirm_order_path
    else
      render :new
    end
  end
  
  def success
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
  
end
