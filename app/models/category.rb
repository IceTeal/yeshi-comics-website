class Category < ApplicationRecord
	has_many :products

	validates :name, presence: true

	mount_uploader :image, CategoryUploader
end
