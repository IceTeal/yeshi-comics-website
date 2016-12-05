ActiveAdmin.register Order do
	permit_params :total, :order_status_id, :customer_id
end
