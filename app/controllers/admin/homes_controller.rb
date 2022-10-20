class Admin::HomesController < ApplicationController
  def top
    @orders = Orders.all.page(params[:page])
    @order = Order.n
  end
end
