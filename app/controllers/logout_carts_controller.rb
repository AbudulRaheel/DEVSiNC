# frozen_string_literal: true

# LogoutCartsController
class LogoutCartsController < ApplicationController
  before_action :set_product, only: %i[create destroy]

  skip_before_action :authenticate_user!

  def index
    products_list = session[:cart] || []
    @products = []
    products_list.each do |item|
      @products << Product.find(item['product_id'])
    end
  end

  def create
    session[:cart] ||= []
    respond_to do |format|
      if session[:cart].find { |product| product['product_id'] == @selected_product }
        format.js { render js: 'alert("Product already in cart.");' }
      else
        session[:cart] << { product_id: @selected_product, quantity: 1 }
        format.js { render js: 'alert("Product Added in cart.");' }
      end
    end
  end

  def destroy
    session[:cart].delete_if { |item| item['product_id'] == @selected_product }
    respond_to do |format|
      format.html { redirect_to logout_carts_path, notice: 'Product Delete.' }
    end
  end

  private

  def set_product
    @selected_product = params[:id]
  end
end
