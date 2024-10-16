class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name   #配送先名
      t.string :address   #配送先住所
      t.string :postal_code   #配送郵便番号
      t.integer :payment_method   #支払方法
      t.integer :total_payment   #支払価格
      t.integer :shipping_cost   #送料
      t.integer :status   #注文ステータス
      t.timestamps
    end
  end
end
