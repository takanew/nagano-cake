class Public::CustomersController < ApplicationController
  before_action :authenticate_customer! 
  # 会員のマイページ
  def show
    
  end
end
