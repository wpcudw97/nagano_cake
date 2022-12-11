class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  enum is_active: {
    販売中: true, #販売中
    販売停止中: false#販売停止中
  }

end
