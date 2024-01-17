class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
   # 全ての注文を取得
  @orders = Order.page(params[:page]) # 
  end
end

