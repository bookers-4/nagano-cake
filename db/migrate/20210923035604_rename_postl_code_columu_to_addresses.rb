class RenamePostlCodeColumuToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :postl_code, :postal_code
  end
end
