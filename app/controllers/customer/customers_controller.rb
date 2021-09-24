class Customer::CustomersController < ApplicationController
    before_action :ensure_correct_customer, {only: [:show, :edit]}
    
    def show
       @customer = Customer.find(params[:id])
    end
    
    def edit
       @customer = Customer.find(params[:id])
    end
    
    def update
      @customer = Customer.find(params[:id])
     if @customer.update(customer_params)
      flash[:success] = "You have edited user data successfully."
      redirect_to customer_path(@customer)
     else
      render 'edit'
     end
    end
    
    def unsubscribe #退会画面を表示させるアクション
      @customer = current_customer
    end
    
    def withdraw #退会を行うアクション
      @customer = current_customer
      @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end
    
    private
     def customer_params
  	  params.require(:customer).permit(:is_enabled, :last_name, :first_name, :furigana_last, :furigana_first, :phone_number, :email, :password, :post_code, :address)
     end

    def ensure_correct_customer
      @customer = Customer.find(params[:id])
     if current_customer.id != @customer.id
      redirect_to root_path
     end
    end
end