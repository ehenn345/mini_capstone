class Api::ProductsController < ApplicationController
  before_action :authenticate_user, only: [:create, :show]

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jb'
  end

  def index
    p current_user
    if params[:search]
      @products = Product.where("name ILIKE ?", "%params[:search]%'")
    else
      @products = Product.all  
    end
    render 'index.json.jb'
  end
  
  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      id: params[:id],
      # image_url: params[:image],
      inventory: params[:inventory]
    )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.id = params[:id]
    @product.name = params[:name]
    @product.price = params[:price]
    # @product.image_url = params[:image]
    @product.description = params[:description]
    @product.inventory = params[:inventory]
    
    if @product.save
      render 'show.json.jb'
    else 
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product removed"}
  end
end
