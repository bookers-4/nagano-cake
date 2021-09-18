class AddIsDeleteToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :is_delete, :string
  end
end
