class CartItem < ApplicationRecord
    belongs_to :customer
    # δΌε‘
    belongs_to :item
    # εε
end
