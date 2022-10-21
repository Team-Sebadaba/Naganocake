class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def index
    @items = Item.all.page(params[:page])
    # @item = Item.new
  end

  def show
    @item = Item.find(params[:id])  
  end

  def edit
    @item = Item.find(params[:id])  
  end
  
  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:image, :item_name, :item_introduction, :genre_id, :non_taxed, :is_active)
  end
  
end
