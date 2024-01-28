class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!


  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.item_id = cart_item_params[:item_id]
  #  params[:cart_item][:item_id]でcart_itemに追加したitem_idを定義し、find_by(item_id)で既存のモデルに検索をかけている
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
  # cart_item.amount = cart_item.amount + params[:cart_item][:amount].to_i
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path
    else
      cart_item.save
      redirect_to cart_items_path
    end
  end

  # 暫定的に作成
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  # total（合計）の算出
  # subtoalメソッドはcart_item.rbで定義
  # 全部のレコードが取り出されるまでループし、@totalは累積されていく。全部取り出されてend
    @cart_items.each do |cart_item|
    @total += cart_item.subtotal
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  # 暫定的に作成
  def destroy
  @cart_item = CartItem.find(params[:id])
  if @cart_item.destroy
    redirect_to cart_items_path, notice: "カートから商品を削除しました。"
  else
    redirect_to cart_items_path, alert: "カートから商品を削除できませんでした。"
  end
  end

  # 暫定的に入力
  def destroy_all
  @cart_items = current_customer.cart_items
  if @cart_items.destroy_all
    redirect_to cart_items_path, notice: "カートを空にしました。"
  else
    redirect_to cart_items_path, alert: "カートを空にできませんでした。"
  end
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
