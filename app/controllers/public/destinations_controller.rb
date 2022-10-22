class Public::DestinationsController < ApplicationController

  def index
    @destination = Destination.new
    @customer = Customer.find(current_customer.id)
    @destinations = @customer.destinations
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.customer_id = current_customer.id
    if @destination.save
        redirect_to destinations_path
    else
       @customer = Customer.find(current_customer.id)
       @destinations = @customer.destinations
       render :index
    end

  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
       redirect_to destinations_path
    end
  end

  def destroy
     @destination = Destination.find(params[:id])
    if @destination.destroy
       redirect_to destinations_path
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:postal, :address, :name, :customer_id)
  end

end
