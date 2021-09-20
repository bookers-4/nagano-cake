class OrderController < ApplicationController

  before_action :to_log, only: [:show]
  before_action :authenticate_customer!

  def new
  	@order = Order.new
  	@shopping_addresses = ShoppingAddress.where(customer: current_customer)
	end

	def log
  @cart_items = current_cart
		@order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method]
    )

  end
end
