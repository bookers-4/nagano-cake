class RemoveNameFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :name, :string
  end
end
