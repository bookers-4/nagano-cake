class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.page(params[:page]).per(10)
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      redirect_to request.referer,notice:"更新できませんでした"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:is_deleted,:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number)
  end

end

