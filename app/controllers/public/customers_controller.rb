class Public::CustomersController < ApplicationController

 def show
     @customer = current_customer
 end

 def edit
     @customer = current_customer
 end

 def update
     @customer = current_customer
     @customer.update(customer_params)
     redirect_to customers_path

#下記は退会確認画面用
     @customer_is_deleted = current_customer
     if @customer_is_deleted.update(params[:is_deleted][:TRUE])
      redirect_to root_path
     end
 end

 def confirm
     @customer = current_customer
 end

  private

   def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_furigana, :first_furigana, :postal, :address, :tel, :email, :is_deleted)
   end

end
