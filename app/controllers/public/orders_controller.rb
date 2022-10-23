class Public::OrdersController < ApplicationController
  # 注文情報入力画面で、注文方法を一通り登録する
  # 確認画面へ進むボタンで注文情報確認へ移動(confirm.html.erbを表示)
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @destinations = current_customer.destinations.all
  end

  def index
    @orders = current_customer.orders.all
    @order = order.find(params[:id])
    #@orders = current_customer.orders.all(params[:page]).reverse_order
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  # 注文情報確認画面(confirm.html.erb)を表示させ、
  # 注文を確定するボタンで注文作成(create)
  # カートの中身+支払方法などの情報(new.html.erbで登録した内容)
  # 作成後、注文完了画面(complete.html.erb)を表示させる
  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      # 今まではformから送信していたデータを手動で送る
      cart_items.each do |cart|
        detail = Detail.new
        detail.item_id = cart_item.item_id
        detail.order_id = @order.id
        detail.amount = cart_item.quantity
        detail.price = cart_item.subtotal
        detail.save
      end
        cart_items.destroy_all
        redirect_to 'complete'
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:payment_method] == '0'
      @order.payment_method = credit_card
    elsif params[:order][:payment_method] == '1'
      @order.payment_method = transfer
    else
      render :new
    end

    # "ご自身の住所"の場合
    # この場合の[:dest]は、radioボタンを使う為だけに設定した一時的なカラムである為、
    # コントローラーにおいてparams[:dest]と記載しただけでは、
    # [:order]に紐づくデータである為、[:order][:dest]と記載する必要がある。
    if params[:order][:dest] == '0'
      @order.shopping_postal = current_customer.postal
      @order.shopping_address = current_customer.address
      @order.shopping_name = current_customer.name_display
    # "登録先住所から選択"の場合
    elsif params[:order][:dest] == '1'
      destination = Destination.find(params[:order][:registered])
      @order.shopping_postal = destination.postal
      @order.shopping_address = destination.address
      @order.shopping_name = destination.to_name
    # "新しいお届け先"の場合
    elsif params[:order][:dest] == '2'
      destination = current_customer.destination.new(destination_params)
      if
        destination.save
      else
        render :new
      end
    else
      redirect_to '/public/orders/confirm'
    end

    @cart_items = current_customer.cart_items.all
  end

  def complete
  end


  private

  def order_params
    params.require(:order).permit(:payment, :total, :destination)
  end

  def destination_params
    params.require(:destination).permit(:postal, :address, :to_name, :customer_id)
  end

end
