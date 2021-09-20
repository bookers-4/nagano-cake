class Customer::ItemsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  def top
    @items = Item.all.(created_at: :asc)
    #=> :asc,古い順 :desc,新しい順
    @genres = Genre.all
	end

	def index
    @genres = Genre.all
   @items = Item.where(is_active: true).page(params[:page]).reverse_order
	end

	def show
    @items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
	end

  def about
  end

	private
	def item_params
		parmas.require(:product).permit(:image ,:name, :explanation, :tax_out_price, :is_sale)
	end

end


