class Admin::OrderDetailsController < ApplicationController
  def update
    # 1件の注文詳取得
    @order_detail = Detail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order_details
    @item_status = Detail.where(item_status: "maiking")
    @order_detail.update(order_detail_params)
    if @item_status.count >= 1
      @order.order_status = "maiking"
      @order.save
    end
    if @item_status.count == Detail.where(item_status: "complete").count
      @order.order_status = "ready_to_ship"
      @order.save
    redirect_to admin_order_path(@order_detail.order.id)
    end
  end

  private

  def order_detail_params
    params.require(:detail).permit(:order_id, :item_id, :item_status, :amount, :price)
  end

end
