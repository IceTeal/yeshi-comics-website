ActiveAdmin.register Product do

	permit_params :name, :description, :image, :remove_image, :price, :category_id



end
