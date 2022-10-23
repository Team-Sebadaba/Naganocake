class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
    #@genres = Genre.all
  end

  private
  def item_params
    params.require(:item).permit(:image, :genre_id, :item_name, :item_introduction, :non_taxed)
  end
end