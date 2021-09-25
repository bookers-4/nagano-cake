class Admin::OrdersController < ApplicationController

    def show
        @order = Order.find(params[:id])
        # ユーザのデータを1件取得し、インスタンス変数へ渡す。
        @order_items = OrderDetail.where(order_id: params[:id])
    end

    def update
        order = Order.find(params[:id])
        order.update(blog_params)
        @order_items = @order.order_items
        if @order.status == "入金確認"
          @order_items.each do |order_item|
            order_item.status = "制作待ち"
            order_item.save
          end
        end
        redirect_to admins_order_path(@order.id)
    end

    private

    def order_params
        params.require(:order).permit(:order_status)
    end

end
