class Admin::ItemsController < ApplicationController
  def index
   @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "新しい商品を作成しました！"
       redirect_to admin_item_path(@item.id)
    else
      flash.now[:alert] = "すべての情報を、正しい形式で入力してください！"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品の変更を保存しました！"
       redirect_to admin_item_path(@item.id)
    else
      flash.now[:alert] = "すべての情報を、正しい形式で入力してください！"
      render :edit
    end
  end

  def destroy
    @item = ITem.find(params[:id])
    @item.save
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction,  :genre_id, :price, :is_sales_status)
  end

end