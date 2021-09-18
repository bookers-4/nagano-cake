class RemoveAddressToCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :address, :string
  end
end
