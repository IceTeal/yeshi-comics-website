class ChargesController < ApplicationController
	def new
		@amount = 500 #change to shopping cart
		@description = 'Description of Charge'
	end

	def create
		amount = 500 #change to shopping cart

		@customer = Stripe::Customer.create(email: params[:stripeEmail],
											source: params[:stripeToken])

		@charge = Stripe::Customer.create(customer: 	 @customer.id,
											amount: 	 amount,
											description: 'Rails Stripe customer',
											currency: 	 'cad')

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

end
