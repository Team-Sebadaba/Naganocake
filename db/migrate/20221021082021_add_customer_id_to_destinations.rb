class AddCustomerIdToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :customer_id, :integer
  end
end
