class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
    @ditail = Ditails.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end
  
  private

  def order_params
    params.require(:order).permit(:last_name, :first_name, :last_furigana, :first_furigana, :postal, :address, :email, :is_deleted)
  end

end
