class ChargesController < ApplicationController
	def new
		@amount = current_order.total #change to shopping cart
		@description = 'Description of Charge'
	end

	def create


		@amount = current_order.total #change to shopping cart

		@customer = Stripe::Customer.create(email: params[:stripeEmail],
											source: params[:stripeToken])

		@charge = Stripe::Customer.create(customer: 	 @customer.id,
											amount: 	 @amount,
											description: 'Rails Stripe customer',
											currency: 	 'cad')

		current_order.payment_type = "Stripe"
	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

end
