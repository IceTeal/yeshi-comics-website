class ChargesController < ApplicationController
	def new
		@amount = current_order.total.to_i #change to shopping cart
		@description = 'Your Purchase'
	end

	def create

		@order = current_order

		@amount = @order.total.to_i #change to shopping cart

		@stripe_customer = Stripe::Customer.create(email: params[:stripeEmail],
											source: params[:stripeToken])

        @charge = Stripe::Charge.create(customer:    @stripe_customer.id,
	                                    amount:      @amount,
	                                    description: 'Rails Stripe customer',
	                                    currency:    'cad')

        @customer = Customer.new


		@response_data = @stripe_customer.sources.first


        @customer.first_name = @response_data.name
        @customer.email = @stripe_customer.email
        @customer.address = "#{@response_data.address_line1}, #{@response_data.address_city}, #{@response_data.address_state}"

        @customer.save


		@order.payment_type = "Stripe"
		@order.status = 2
		@order.date = Date.current
		@order.customer = @customer
		@order.save	

		session[:order_id] = nil

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

end
