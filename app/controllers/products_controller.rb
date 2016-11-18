class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def search #Displays a search form

  end

  def search_results #Displays search results.
    @found_products = Product.keyword_search(params[:search_keywords], params[:category_id])
  end

  def show
  	@product = Product.find(params[:id]) # Find the product with the primary key mentioned in the URL.
  end
end
