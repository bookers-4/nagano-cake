class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id, foreign_key: true , null: false
      t.integer :item_id, foreign_key: true , null:false
      t.integer :amount, null:false

      t.timestamps
    end
  end
end
