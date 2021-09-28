class CartItem < ApplicationRecord
    belongs_to :customer
    # 会員
    belongs_to :item
    # 商品
end
