class Admin::HomesController < ApplicationController
  def top
    @details = Detail.all.page(params[:page])
  end
end
