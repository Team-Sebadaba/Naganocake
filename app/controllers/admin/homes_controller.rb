class Admin::HomesController < ApplicationController
  def top
    # @customers = Customer.all
    @orders = Order.order("created_at DESC").page(params[:page])
    @order = Order.new
    @details = Detail.all
  end

   private

  def admin_order_params
    params.require(:order).permit(:last_name, :first_name, :last_furigana, :first_furigana, :postal, :address, :email, :is_deleted)
  end

  def order_detail_params
    params.require(:detail).permit(:order_id, :item_id, :item_status, :amount, :price)
  end


end
