class AddPriceToOrderDetales < ActiveRecord::Migration[5.0]
  def change
    add_column :order_detales, :price, :integer
  end
end
