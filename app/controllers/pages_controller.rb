class PagesController < ApplicationController
  def home
    @products = Product.all
  end
  
  def show
    @page = Page.find_by(slug: params[:string].to_s)
  end
  
  def contact
  end
end
