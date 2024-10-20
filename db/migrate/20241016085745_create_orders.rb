class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name, null: false   #配送先名
      t.string :address, null: false   #配送先住所
      t.string :postal_code, null: false   #配送郵便番号
      t.integer :payment_method, null: false   #支払方法
      t.integer :total_payment, null: false   #支払価格
      t.integer :shipping_cost, null: false   #送料
      t.integer :status, null: false   #注文ステータス
      t.timestamps
    end
  end
end
