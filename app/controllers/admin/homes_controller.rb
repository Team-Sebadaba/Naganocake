class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.all.page(params[:page])
  end
end
