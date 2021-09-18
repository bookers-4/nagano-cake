class AddAmountToOrderDetales < ActiveRecord::Migration[5.0]
  def change
    add_column :order_detales, :amount, :integer
  end
end
