class Customer::CartItemsController < ApplicationController


  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.page(params[:page]).per(4)
  end

  def create

    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    item_id = params[:cart_item][:item_id]
    amount  = params[:cart_item][:amount]
    cart_item = current_customer.cart_items.find_by(item_id: item_id)

    if cart_item.present?

      cart_item.amount = amount.to_i
      cart_item.save
      redirect_to cart_items_path

    elsif @cart_item.save

      redirect_to cart_items_path

    else

      @item = Item.find_by(id:@cart_item.item_id)
      @genres = Genre.all
      @cart_items = CartItem.new
      flash[:notice] = '個数を選択してください、もしくは上限の20個以上商品を追加しようとしています'
      # redirect_to item_path(@item.id)
      render template: "items/show"

    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end


  def all_destroy
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end