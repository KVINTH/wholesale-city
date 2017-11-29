class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  helper_method :current_order, :logged_in?
  before_action :set_current_user

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else 
      Order.new
    end
  end

  def set_current_user
    ::User.current_user = session[:user_id]
  end

  private
  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end