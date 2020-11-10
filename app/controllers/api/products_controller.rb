class Api::ProductsController < ApplicationController
  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jb'
  end

  def index
    @products = Product.all
    render 'index.json.jb'
  end
  
  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      id: params[:id],
      image_url: params[:image]
    )
    render 'show.json.jb'
  end

end
