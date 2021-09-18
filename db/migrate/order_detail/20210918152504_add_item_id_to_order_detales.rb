class AddItemIdToOrderDetales < ActiveRecord::Migration[5.0]
  def change
    add_column :order_detales, :item_id, :integer
  end
end
