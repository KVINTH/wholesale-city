class ProductsController < ApplicationController
  def all
    #@products = Product.all
    @order_item = current_order.order_items.new
    if params[:category] != "" and params[:search]
      category = Category.find(params[:category])
      @products = category.products.search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
    elsif params[:search]
      @products = Product.search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
    else
      @products = Product.all.order("created_at DESC").page(params[:page]).per(5)
    end
  end

  def category
    @products = Category.find_by(name: params[:string].to_s.capitalize).products.page(params[:page]).per(5)
    @order_item = current_order.order_items.new
  end

  def new
    #@products = Product.where(created_at: 1.week.ago .. Date.today).page(params[:page]).per(5)
    @products = Product.where("DATE(created_at) >= ?", Date.today-7).page(params[:page]).per(5)
    @order_item = current_order.order_items.new
  end

  def updated
    @products = Product.where("DATE(updated_at) >= ?", Date.today-1).page(params[:page]).per(5)
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:number].to_i)
    @order_item = current_order.order_items.new
  end
end
