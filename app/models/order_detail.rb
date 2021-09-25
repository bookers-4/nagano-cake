class OrderDetail < ApplicationRecord

  belongs_to :order
	belongs_to :item

	validates :item_id, :order_id, :amount,
			  		:price, presence: true
	validates :price, :amount, numericality: { only_integer: true }

	enum making_status: {production_not_possible:0,production_pending:1,in_production:2,production_complete:3}



end
