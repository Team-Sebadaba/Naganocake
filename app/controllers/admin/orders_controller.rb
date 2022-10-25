class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @details = Detail.all
    @subtotal_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment, :order_status, :postage, :total, :shipping_postal, :shipping_address, :shipping_name)
  end

end