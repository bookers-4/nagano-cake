class Customer::HomesController < ApplicationController
  def top
  end
  
  def about
  end
  
  # 退会画面と処理のアクション
  def unsubscribe
    @customer = Customer.find_by(name: params[:name])
  end
  
  def withdraw
    @customer = Customer.find_by(name: params[:name])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end
end
