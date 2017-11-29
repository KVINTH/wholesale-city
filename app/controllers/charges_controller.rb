class ChargesController < ApplicationController
  def new
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
      @order = Order.find(session[:order_id])
      @order_items = current_order.order_items

      # set subtotal for order
      subtotal = 0
      @order_items.each do |item|
        subtotal = subtotal + (item.quantity * item.product.price)
      end
      @order.subtotal = subtotal
      @order.tax = (subtotal * @user.province.gst_rate) + (subtotal * @user.province.pst_rate) + (subtotal * @user.province.hst_rate)
      @order.total = @order.subtotal + @order.tax
      #@order.user = User.find(session[:user_id])
    end
    @amount = @order.total
    @description = 'PURCHASE OF GOODS' # description of charge
  end

  def create
    amount = @order.total # $5 in cents
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
