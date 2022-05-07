# frozen_string_literal: true

# ProductsController
class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy show]
  before_action :authenticate_user, except: %i[index show]
  before_action :product_authorization, only: %i[edit update destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    respond_to do |format|
      if @product.save
        format.html { redirect_to myproducts_path(@product), notice: 'Product was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def myproducts
    @products = Product.all
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to myproducts_path, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @product.destroy
        format.html { redirect_to myproducts_path, notice: 'Product was successfully destroyed.' }
      else
        flash.alert = 'Error in deleting product'
      end
    end
  end

  def show
    @comment = Comment.new
    @comments = @product.comments
  end

  def search
    @products = Product.where('product_name ILike ?', "%#{params[:q]}%")
  end

  private

  def set_product
    @product = Product.find_by_id(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name, :description, :price, :quantity, images: [])
  end

  def product_authorization
    authorize @product
  end
end
