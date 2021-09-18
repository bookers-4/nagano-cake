class AddFirstNameToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :first_, :string
    add_column :customers, :name, :string
  end
end
