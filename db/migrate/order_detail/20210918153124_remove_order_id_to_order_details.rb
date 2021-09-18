class RemoveOrderIdToOrderDetails < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_details, :order_id, :integer
  end
end
