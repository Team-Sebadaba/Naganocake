class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  # quantityを変更したら小計が変更されるようにする
  # (小計が変更されたら合計も変更される？)
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)

    redirect_to cart_items_path
  end

  #カート内商品の一つを削除
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  # カート内商品全てを削除
  def destroy_all
    @cart_item = current_customer.cart.items
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  # 商品をカートに追加
  def create
    @cart_item.customer_id = current_user
    @cart_item.item_id = params
     # 1.追加した商品がカート内に存在するかの判別
    # 存在した場合
     # 2.カート内の個数をフォームから送られた個数分追加する
    # 存在しなかった場合
     # カートモデルにレコードを新規作成する
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?

     cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
     cart_item.quantity += params[:cart_item][:quantity].to_i
     redirect_to cart_items_path

    elsif @cart_item.save
     @cart_items = current_customer.cart_items.all
     render "index"

    else
     render "index"
     
    end
  end

  private
  def cart_item_paramas
    params.require(:cart_item).permit(:item_id, :non_taxed, :quantity)
  end
end
