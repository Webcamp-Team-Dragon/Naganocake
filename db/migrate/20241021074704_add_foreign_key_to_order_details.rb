class AddForeignKeyToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :order_details, :items
  end
end
