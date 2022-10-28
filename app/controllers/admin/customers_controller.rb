class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all.page(params[:page])
  end


  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
   else
      render :edit
   end
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_id, :payment, :order_status, :postage, :total, :shipping_postal, :shipping_address, :shipping_name,
                                     :last_name, :first_name, :last_furigana, :first_furigana, :postal, :address, :tel, :email, :is_deleted)
  end
end