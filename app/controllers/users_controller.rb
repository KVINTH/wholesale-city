class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'thank you for signing up!'
    else
      render :new
    end
  end

  def update
    @user = User.find(session[:user_id])
  end

  def orders
    @user = User.find(session[:user_id])
    @orders = @user.order.all
  end

  private
  def allowed_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :address, :province_id)
  end
end
