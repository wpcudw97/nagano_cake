class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  has_one_attached :item_image

  enum is_active: { #販売ステータス
    販売中: true,
    販売停止中: false
  }

  def with_tax_price #税込の表示
    (price * 1.1).floor
  end


  def get_item_image(width,height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpeg')
      item_image.attach(io: File.open(file_path), filename: 'noimage.jpeg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width,height]).processed
  end

end
