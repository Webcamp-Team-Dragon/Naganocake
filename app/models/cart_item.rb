class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :item_id, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 } # 1以上であること
end
