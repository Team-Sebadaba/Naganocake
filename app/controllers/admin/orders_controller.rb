class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @details = @order.details.all
    @subtotal_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    if @order.order_status == "payment"
      @order_details.each do |order_detail|
        order_detail.item_status  = "waiting"
        order_detail.save
      end
    end
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment, :order_status, :postage, :total, :shipping_postal, :shipping_address, :shipping_name)
  end

end