class CartsController < ApplicationController
  def show
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
    end
    @order_items = current_order.order_items
    @order = current_order
  end
  def checkout
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
  end
end
