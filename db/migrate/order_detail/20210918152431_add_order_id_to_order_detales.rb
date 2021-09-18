class AddOrderIdToOrderDetales < ActiveRecord::Migration[5.0]
  def change
    add_column :order_detales, :Order_id, :integer
  end
end
