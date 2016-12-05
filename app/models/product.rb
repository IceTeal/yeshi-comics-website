class Product < ApplicationRecord
  attr_accessor :remove_image

  belongs_to :category
  has_many :order_items

  validates :name, :price, :category_id, presence: true

  mount_uploader :image, ProductUploader

  def self.keyword_search(search, category)
    where("category_id = #{category} AND (name LIKE ? OR description LIKE ?)", "%#{search}%", "%#{search}%") 
  end
end
