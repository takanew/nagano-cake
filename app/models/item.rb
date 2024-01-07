class Item < ApplicationRecord

  has_one_attached :item_image
  
  has_many :cart_items, dependent: :destroy
  
  validates :name, :introduction, :price, presence: true

  def get_image
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image
  end

  # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
  
end
