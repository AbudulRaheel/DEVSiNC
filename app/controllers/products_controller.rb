class ProductsController < ApplicationController
  #   before_save :generate_serial_number
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    redirect_to product_path(@product) if @product.save
  end

  def show; end

  private

  def generate_serial_number; end

  def product_params
    params.require(:product).permit(:product_name, :descriptio, :price, images: [])
  end
end
