class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :item_status, null: false, default: "0"
      t.integer :amount, null: false, default: ""
      t.integer :price, null: false, default: ""

      t.timestamps
    end
  end
end
