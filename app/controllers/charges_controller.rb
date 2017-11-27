class ChargesController < ApplicationController
  def new
    @amount = 500 # $5 in cents
    @description = 'PURCHASE OF GOODS' # description of charge
  end

  def create
    amount = 500 # $5 in cents
    @customer = Stripe::Customer.create(email:   params[:stripeEmail],
                                       source:  params[:stripeToken])
    @charge = Stripe::Charge.create(customer:   @customer.id,
                                   amount:      amount,
                                   description: 'PURCHASE OF GOODS',
                                   currency:    'cad')

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
