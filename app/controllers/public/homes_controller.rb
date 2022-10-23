class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Genre.all
    @item = Item
  end

  def about
  end
  
end
