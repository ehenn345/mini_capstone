class Api::ProductsController < ApplicationController
  def all_products
    return Product.all
end
