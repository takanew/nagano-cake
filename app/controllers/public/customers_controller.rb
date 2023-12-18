class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  # 会員のマイページ
  def show
    @customer = current_customer
  end
  
  # 会員情報編集ページ 
  def edit
  end
end
