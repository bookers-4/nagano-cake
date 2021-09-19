class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.intenger :customer_id, foreign_key: ture , null: false
      t.string :postl_code, null: false
      t.string :address, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
