class Customer::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.order("created_at DESC").page(params[:page]).per(4)
  end
  

  def about
  end

end
