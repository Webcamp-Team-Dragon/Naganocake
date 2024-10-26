class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id, null: false  # 会員ID
      t.integer :item_id, null: false      # 商品ID
      t.integer :amount, null: false       # 数量

      t.timestamps
    end

    # 外部キー制約（オプション）
    add_foreign_key :cart_items, :customers
    add_foreign_key :cart_items, :items
  end
end
