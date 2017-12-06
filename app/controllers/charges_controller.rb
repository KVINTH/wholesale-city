class ChargesController < ApplicationController
  def new
    if !session[:user_id].nil?
    end
    @amount = order.total
    @description = 'PURCHASE OF GOODS' # description of charge
  end

  def create
    user = User.find(session[:user_id])
    order = Order.find(session[:order_id])
    order_items = order.order_items

    subtotal = 0
    order_items.each do |item|
      subtotal = subtotal + (item.quantity * item.product.price)
    end
    order.subtotal = subtotal
    order.tax = (subtotal * user.province.gst_rate) + (subtotal * user.province.pst_rate) + (subtotal * user.province.hst_rate)
    order.total = (order.subtotal + order.tax).round(2)
    order.order_status = OrderStatus.find_by(name: "Paid")
    order.save
    order = Order.find(session[:order_id])
    amount_string = (order.total * 100)
    amount = strip_trailing_zero(amount_string)
    

    @customer = Stripe::Customer.create(email:   params[:stripeEmail],
                                       source:  params[:stripeToken])
    @charge = Stripe::Charge.create(customer:   @customer.id,
                                   amount:      amount,
                                   description: 'PURCHASE OF GOODS',
                                   currency:    'cad')
    # destroy order session once complete
    session[:order_id] = nil
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
  def strip_trailing_zero(n)
    n.to_s.sub(/\.?0+$/, '')
  end
end
