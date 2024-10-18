class RemoveTelephoneCodeFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :telephone_code, :string
  end
end
