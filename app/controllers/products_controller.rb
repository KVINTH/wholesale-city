class ProductsController < ApplicationController
  def all
    @products = Product.all
  end

  def category
    @products = Category.find_by(name: params[:string].to_s.capitalize).products
  end

  def show
    @product = Product.find(params[:number].to_i)
  end
end
