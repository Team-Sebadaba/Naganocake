class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to '/admin/items'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:item_name, :item_introduction, :non_taxed)
  end
  
end
