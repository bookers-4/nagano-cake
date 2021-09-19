class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.intenger :customer_id, foreign_key: true , null: false
      t.intenger :item_id, foreign_key: true , null:false
      t.intenger :amount, null:false

      t.timestamps
    end
  end
end
