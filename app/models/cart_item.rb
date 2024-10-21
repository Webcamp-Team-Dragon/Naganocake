class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :item_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 } # 1以上であること

  # カートアイテムの合計金額を返すメソッド
  def total_price
    item.price * amount
  end
end
