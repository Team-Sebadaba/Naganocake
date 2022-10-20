class RemoveQuantityFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :quantity, :integer
  end
end
