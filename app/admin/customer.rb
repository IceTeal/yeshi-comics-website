ActiveAdmin.register Customer do
	permit_params :first_name, :last_name, :address, :post_code, :phone, :email
end
