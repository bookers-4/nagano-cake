class Customer::OrdersController < ApplicationController

	before_action :authenticate_customer!

	def about
		@order = Order.new
		@customer = current_customer
		@addresses = Address.where(customer_id: current_customer.id)
	end

	def create
		customer = current_customer

		# sessionを使ってデータを一時保存
		@order = Order.new
		@order.save
		redirect_to orders_complete_path

	end


	def new
		@order = Order.new
		customer = current_customer
		@cart_items = current_customer.cart_items
		sum = 0
		@cart_items.each do |cart_item|
			sum += cart_item.item.total_price(cart_item.amount)
		end

		@payment = sum

		cart_items = current_customer.cart_items

		@order_status = 0
		@order.customer_id = current_customer.id
		# ラジオボタンで選択された支払方法のenum番号を渡している
		@payment_method = params[:order][:payment_method].to_i

		# ラジオボタンで選択されたお届け先によって条件分岐
		@shopping_address = params[:a_method].to_i

		# ご自身の住所が選択された時
		if @shopping_address == 0

			@order.postal_code = customer.postal_code
			@order.address = customer.address
			@order.name = customer.last_name + customer.first_name

		# 登録済住所が選択された時
		elsif @shopping_address == 1

			@address = Address.find(params[:address_order])
			@post_code = address.postal_code
			@order.address = address.address
			@address.name = address.name

		# 新しいお届け先が選択された時
		elsif @shopping_address == 2

			@post_code = params[:post_code]
			@address = params[:address]
			@name= params[:name]

		end


		# お届け先情報に漏れがあればリダイレクト
		#if @post_code.present? && @shopping_address.present? && @name.present?
		   #redirect_back(fallback_location: root_path)
		 #end
	# binding.pry

	end



	def complete
		order = Order.new(session[:order])
		order.save

		if  @new_address
			address = current_customer.addresses.new
			address.postal_code = order.post_code
			address.address = order.address
			address.name = order.name
			address.save
			@new_address = nil
		end

		# 以下、order_detail作成
		cart_items = current_customer.cart_items
		cart_items.each do |cart_item|
			order_detail = OrderDetail.new
			order_detail.order_id = order.id
			order_detail.item_id = cart_item.item.id
			order_detail.amount = cart_item.amount
			order_detail.making_status = 0
			order_detail.price = cart_item.item.total_price(cart_item.amount)
			#order_detail.save
		end

		# 購入後はカート内商品削除
		cart_items.destroy_all
	end

	#def index
		#@orders = current_customer.orders
	#end

	#def show
		#@order = Order.find(params[:id])
		#@order_details = @order.order_details
	#end

	  private
		def address_params
		 	params.require(:address).permit(:customer_id, :postal_code, :name, :address)
		end

	    def order_params
	       params.require(:order).permit(:customer_id, :total_payment, :payment_method, :ordr_status, :post_code, :address, :name)
	    end


	    def order_detail_params
	       params.require(:order_detail).permit(:order_id, :item_id, :amount, :making_status, :price)
	    end



end
