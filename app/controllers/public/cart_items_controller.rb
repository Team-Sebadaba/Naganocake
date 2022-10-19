class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
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
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_user
    @cart_item.item_id = params[:item_id]
    if @cart_item.save
     redirect_to cart_items_path
    else
     render "customers/items/:id"
    end
  end

  private
  def cart_item_paramas
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
