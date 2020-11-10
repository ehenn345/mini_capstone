class Api::ProductsController < ApplicationController
  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jb'
  end

  def index
    @product = Product.all
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

  def update
    @product = Product.find_by(id: params[:id])
    @product.id = params[:id]
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image]
    @product.description = params[:description]
    
    @product.save
    render 'show.json.jb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product removed"}
  end
end
