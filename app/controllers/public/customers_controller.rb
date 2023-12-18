class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  # 会員のマイページ
  def show
    @customer = current_customer
  end
  
  # 会員情報編集ページ 
  def edit
  @customer = current_customer
  end
  
  # 会員情報更新
  def update
  @customer = current_customer
  if @customer.update(customer_params)
  # 更新成功時
    redirect_to customers_my_page_path
  else
  # 更新失敗時
    render :edit
  end 
  end 
end

  
private

def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
end  
 
