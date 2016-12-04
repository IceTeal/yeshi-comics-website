ActiveAdmin.register Order do
	permit_params :total, :status, :customer_id
end
