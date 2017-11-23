class ProductsController < ApplicationController
  def all
    @products = Product.all
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.all.order("created_at DESC") 
    end
  end

  def category
    @products = Category.find_by(name: params[:string].to_s.capitalize).products
  end

  def show
    @product = Product.find(params[:number].to_i)
  end
end
