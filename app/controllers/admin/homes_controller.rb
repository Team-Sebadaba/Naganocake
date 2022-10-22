class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.page(params[:page])
    @order = Order.new
  end
end
