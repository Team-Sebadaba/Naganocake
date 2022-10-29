class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = Detail.find(params[:id])
    # byebug
    @order = @order_detail.order
    @order_details = @order.details
    @order_detail.update(order_detail_params)
    if @order_details.where(item_status: "maiking").count >= 1
      @order.order_status = "maiking"
      @order.save
    end
    if @order.details.count == @order_details.where(item_status: "complete").count
      @order.order_status = "ready_to_ship"
      @order.save
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private

  def order_detail_params
    params.require(:detail).permit(:item_status)
  end

end
