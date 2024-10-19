class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

   attachment :image
   
  def add_tax_price
    (self.price * 1.08).round
  end
   
  def get_image
   unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
      image
  end
end
