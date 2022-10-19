class Public::CustomersController < ApplicationController

 def show
   @customer = current_customer
 end


# private

  # def customer_params
    # params.require(:customer).permit(:sign_up, keys: [:last_name, :first_name, :last_furigana, :first_furigana, :postal, :address, :tel])
  # end

end
