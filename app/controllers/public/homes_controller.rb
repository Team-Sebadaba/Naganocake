class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    #@items = Item.order('id DESK').limit(4)
    @genres = Genre.all
  end

  def about
  end
end
