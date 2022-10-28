class Public::OrdersController < ApplicationController
  before_action :check_cart_item, except: [:index, :show, :complete]
  # 注文情報入力画面で、注文方法を一通り登録する
  # 確認画面へ進むボタンで注文情報確認へ移動(confirm.html.erbを表示)
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @destinations = current_customer.destinations.all
    @destination = Destination.new
  end

  def index
    @orders = current_customer.orders.all
    #@orders = current_customer.orders.all(params[:page]).reverse_order
  end

  def show
    @order= current_customer.order.find(params[:id])
    @order_details = @order.order_details.all
  end


  # 注文情報確認画面(confirm.html.erb)を表示させ、
  # 注文を確定するボタンで注文作成(create)
  # カートの中身+支払方法などの情報(new.html.erbで登録した内容)
  # 作成後、注文完了画面(complete.html.erb)を表示させる
  def create
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
      # 今まではformから送信していたデータを手動で送る
      # 会員側ではdetailsコントローラは用意しない為。
      current_customer.cart_items.each do |cart_item|
        detail = Detail.new
        detail.order_id = @order.id
        detail.item_id = cart_item.item_id
        detail.amount = cart_item.quantity
        detail.price = cart_item.subtotal
        detail.save!
      end
    redirect_to orders_complete_path
    current_customer.cart_items.destroy_all
  end

  def show
    @order = Order.find(params[:id])
    @order.details = @order.details.all
    @subtotal = 0
  end

  def confirm
    @order = Order.new(order_params)

    if params[:order][:payment] == 'credit_card'
      @order.payment = 'credit_card'
    elsif params[:order][:payment] == 'transfer'
      @order.payment = 'transfer'
    else
      render :new
    end

    # "ご自身の住所"の場合
    # この場合の[:dest]は、radioボタンを使う為だけに設定した一時的なカラムである為、
    # コントローラーにおいてparams[:dest]と記載するだけでは呼び出せない。
    # [:order]に紐づくデータである為、[:order][:dest]と記載する必要がある。
    if params[:order][:dest] == '0'
      @order.shipping_postal = current_customer.postal
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.name_display
    # "登録先住所から選択"の場合
    elsif params[:order][:dest] == '1'
      destination = Destination.find(params[:order][:destination])
      @order.shipping_postal = destination.postal
      @order.shipping_address = destination.address
      @order.shipping_name = destination.name
    elsif params[:order][:dest] == '2'
        @destination = Destination.new
        @destination.postal = @order.shipping_postal
        @destination.address = @order.shipping_address
        @destination.name = @order.shipping_name
        @destination.customer_id = current_customer.id
      unless @destination.save
        render :new
      end
    end
    @total = 0
    @cart_items = current_customer.cart_items.all
  end

  def complete
  end


  private

  def order_params
    params.require(:order).permit(:payment, :total, :shipping_postal, :shipping_address, :shipping_name)
  end

  def destination_params
    params.require(:order).permit(:postal, :address, :name, :customer_id)
  end

  def check_cart_item
    unless current_customer.cart_items.exists?
      redirect_to items_path
    end
  end

end
