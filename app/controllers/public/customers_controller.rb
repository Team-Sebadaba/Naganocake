class Public::CustomersController < ApplicationController

 def show
     @customer = current_customer
 end

 def edit
     @customer = current_customer
 end

 def update
     @customer = current_customer
     if @customer.update(customer_params)
        redirect_to customers_path
     else
      @customer = current_customer
      render :edit
     end
 end

#下記は退会確認画面用
 def withdraw
     # @customer_is_deleted = current_customer
     # if @customer_is_deleted.update(params[:is_deleted][:true])
      # redirect_to root_path
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
 end

 def confirm
     # @customer = current_customer
 end

  private

    def customer_params
       params.require(:customer).permit(:last_name, :first_name, :last_furigana, :first_furigana, :postal, :address, :tel, :email, :is_deleted)
    end

end
