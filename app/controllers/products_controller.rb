class ProductsController < ApplicationController
  #   before_save :generate_serial_number

  before_action :set_product, only: %i[edit update destory]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    redirect_to myproducts_path(@product) if @product.save
  end

  def myproducts
    @products = Product.all
  end

  def update
    if @product.update(product_params)
      redirect_to product_path, notice: 'Product updated sucessfully'

    else
      render :edit
    end
  end

  def edit; end

  def destroy
    @product = Product.find_by_id(params[:id])

    @product.destroy

    respond_to do |format|
      format.html { redirect_to myproducts_path, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
      format.js
    end

    # if @product.present?
    # redirect_to product_path, notice: 'Product was deleted sucessfully'
  end

  def show
    @product = Product.find_by_id(params[:id])
    @comment = Comment.new
    @comments = Comment.where(product_id: @product.id)
  end

  private

  def set_product
    @product = Product.find_by_id(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :descriptio, :price, :quantity, images: [])
  end
end
