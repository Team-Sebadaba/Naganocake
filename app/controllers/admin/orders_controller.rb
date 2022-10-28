class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @details = @order.details
    @subtotal_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.details
    if @order.order_status == "waiting_payment"
      @order_details.each do |order_detail|
        order_detail.item_status  = "impossible_making"
        order_detail.save
      end
    elsif @order.order_status == "payment"
      @order_details.each do |order_detail|
        order_detail.item_status  = "waiting"
        order_detail.save
      end
    end
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end