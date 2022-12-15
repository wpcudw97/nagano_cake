class Customer < ApplicationRecord
  belongs_to :genre
  has_one_attached :item_image

  def get_item_image(width,height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpeg')
      item_image.attach(io: File.open(file_path), filename: 'noimage.jpeg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width,height]).processed
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
