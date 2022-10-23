class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @destinations = current_customer.destinations.all
  end

  def index
    @orders = current_customer.orders.all
  end

  def show  
    @order= current_customer.order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def create
    @order = current_customer.orders.new(order_params)
  end

  def confirm
  end

  def complete
  end


  private

  def order_params
    params.require(:order).permit()
  end

  def destination_params
    params.require(:destination).permit(:postal, :address, :name, :customer_id)
  end

end
