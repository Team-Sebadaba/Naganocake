class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.integer :payment, default: "0"
      t.integer :order_status, default: "0"
      t.integer :postage
      t.integer :total
      t.string :shipping_postal
      t.string :shipping_address
      t.string :shipping_name

      t.timestamps
    end
  end
end
