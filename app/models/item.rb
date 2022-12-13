class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_one_attached :item_image

  enum is_active: {
    販売中: true, #販売中
    販売停止中: false #販売停止中
  }

  def add_tax_price
    (self.price * 1.10).round
  end


  def get_item_image(width,height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpeg')
      item_image.attach(io: File.open(file_path), filename: 'noimage.jpeg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width,height]).processed
  end

end
