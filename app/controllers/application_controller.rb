class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  helper_method :current_order, :logged_in?

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else 
      Order.new
    end
  end

  private
  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end