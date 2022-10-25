class Public::CartItemsController < ApplicationController
  before_action :move_to_signed_in

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
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  # 商品をカートに追加
  def create
    if current_customer.cart_items.exists?(item_id: params[:cart_item][:item_id])
    cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    cart_item.quantity += params[:cart_item][:quantity].to_i
    cart_item.save
    redirect_to cart_items_path
    else
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @item = Item.find(cart_item_params[:item_id])
    @cart_item.save
    redirect_to cart_items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :non_taxed, :quantity)
  end

  def move_to_signed_in
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
  end
end
