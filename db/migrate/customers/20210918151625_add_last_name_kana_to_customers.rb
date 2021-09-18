class AddLastNameKanaToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :last_, :string
    add_column :customers, :name_kana, :string
  end
end
