class CustomerController < ApplicationController
    def create
    end
    
    def show
      @customer = Customer.find(params[:id])
    end
    
    
    def index
    end
    
    def edit
    end
    
    def delete
    end
    

end
