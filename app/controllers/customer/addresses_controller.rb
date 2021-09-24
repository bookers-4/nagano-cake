class Customer::AddressesController < ApplicationController
   before_action :authenticate_customer!

  def index
   @address = Address.new
   @addresses = current_customer.addresses
   #アソシエーションの関係上、addressesを使用する。カスタマーが持っているアドレスの情報を取り出すため
  end

  def create
   @address = Address.new(address_params)
   @address.customer_id = current_customer.id
    if @address.save
	  flash.now[:notice] = "新規配送先を登録しました"
	    redirect_to addresses_path
    else
	   @addresses = current_customer.addresses
	    render 'index'
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end

  def update
	 @address = Address.find(params[:id])
   if @address.update(address_params)
  	flash[:success] = "配送先を変更しました"
     redirect_to addresses_path
   else
	 render "edit"
   end
  end

  def destroy
   @address = Address.find(params[:id])
   @address.destroy
   @addresses = current_customer.address
   flash.now[:alert] = "配送先を削除しました"
	  redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :last_name, :first_name)
  end

end
