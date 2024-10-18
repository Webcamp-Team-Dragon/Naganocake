class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  has_one_attached :image

  def get_image(width,height)
    self.image.variant(resize_to_limit: [width,height]).processed
  end
end
