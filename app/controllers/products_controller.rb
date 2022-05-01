class ProductsController < ApplicationController
  #   before_save :generate_serial_number

  before_action :set_product, only: %i[edit update destory]
  before_action :authenticate_user!, except: %i[index show]
  # before_action :authorization, only: %i[edit update destroy]
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
    respond_to do |format|
    if @product.update(product_params)
        format.html { redirect_to myproducts_path, notice: 'Product was successfully updated.' }
        # format.json { head :no_content }
        # format.js
    end
    end
    #   render :edit
    # end
  end

  def edit; end

  def destroy
    @product = Product.find_by_id(params[:id])

    respond_to do |format|
      if @product.destroy

        format.html { redirect_to myproducts_path, notice: 'Product was successfully destroyed.' }
      else
        flash.alert = 'Error in deleting product'
      end
    end
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

  def authorization
    authorize @product
  end
end
