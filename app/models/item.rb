class Item < ApplicationRecord
   has_many :cart_items
  has_many :order_details
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: [true, false]

  def add_tax_price
    (self.price*1.10).round
  end

   def total_price(amount)
    (self.price*amount*1.10).round
   end




end
