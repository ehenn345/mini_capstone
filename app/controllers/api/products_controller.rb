class Api::ProductsController < ApplicationController
  def one_products
    @product = Product.first
    render 'product.json.jb'
  end
end
