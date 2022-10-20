class Admin::HomesController < ApplicationController
  def top
    @orders = Orders.all.page(params[:page])
  end
end
