class Admin::OrdersController < ApplicationController

    def show
        @order = Order.find(params[:id])
        # ユーザのデータを1件取得し、インスタンス変数へ渡す。
        @order_items = OrderDetail.where(order_id: params[:id])
    end

    def update
        order = Order.find(params[:id])
        order.update(blog_params)
        redirect_to admin_order_path
    end

    private

    def order_params
        params.require(:order).permit(:order_status)
    end

end
