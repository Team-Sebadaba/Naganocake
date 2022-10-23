class Admin::OrderDetailsController < ApplicationController
    def update
        @order_detail = Detail.find(params[:id])
        @order_detail.update(order_params)
        redirect_to admin_order_path
    end
end
