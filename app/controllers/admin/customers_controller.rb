class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers = Customer.page(params[:page])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  # 以下編集途中
  def edit
    @customer = Customer.find(params[:id])
  end
  
  # updateはnewと異なり、既存のレコードを抽出する必要があるため、params[:id]を引数に指定する必要がある。
  def update
  @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  else
    render :edit
  end
  end  
  
end

private

def customer_params
  params.require(:customer).permit(:name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :is_active, :email)
end
