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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.item_id = cart_item.item_id
        @order_item.order_id = @order.id
        @order_item.purchase_price = cart_item.item.with_tax_price
        @order_item.amount = cart_item.amount
        @order_item.save
        cart_item.destroy
      end
      redirect_to success_order_path
    else
      @customer = current_customer
      @cart_items = current_customer.cart_items
      render :new
    end
  end

  def index
  @orders = current_customer.orders
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :recipient, :payment_amount, :postage)
  end

end
