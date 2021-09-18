class AddMakingStatusToOrderDetales < ActiveRecord::Migration[5.0]
  def change
    add_column :order_detales, :making_status, :integer
  end
end
