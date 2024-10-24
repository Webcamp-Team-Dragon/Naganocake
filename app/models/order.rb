class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details # 関連する商品も取得できるように

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }
  
  def add_tax_price
   (self.item.price * 1.10).round
  end
  

  def add_tax_price
    (self.price * 1.10).round
  end

end