class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details # 関連する商品も取得できるように

  enum payment_method: { credit_card: 0, transfer: 1 }
end