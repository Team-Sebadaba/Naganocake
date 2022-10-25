class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = Order.order_detail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path
  end

  private

  def order_detail_params
    params.require(:detail).permit(:order_id, :item_id, :item_status, :amount, :price)
  end

end
