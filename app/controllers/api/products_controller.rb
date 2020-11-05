class Api::ProductsController < ApplicationController
  def one_products
    @product = Product.first
    render 'product.json.jb'
  end

  def todo
    render 'all.json.jb'
  end
end
