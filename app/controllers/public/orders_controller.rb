class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @customer = current_customer
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    # ラジオボタン０が選択された場合にorderモデルにどんなデータを入れるか指定する。
    # なお、今回は０、２のみで２については上記の@order = Order.new(order_params)で指定してるから、ifの条件分岐はいらない
    if  params[:order][:select_address] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.recipient = current_customer.first_name + current_customer.last_name
    end
    @total = 0
    @cart_items.each do |cart_item|
    @total += cart_item.subtotal
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
    params.require(:order).permit(:payment_method, :postal_code, :address, :recipient)
  end
  
end
