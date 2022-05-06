# frozen_string_literal: true

# CartProductsController
class CartProductsController < ApplicationController
  include CartsHelper
  before_action :set_cart_item, only: %i[edit update destroy]

  def create
    @cart_item = CartProduct.new(cart_product_params)
    @cart_item.cart_id = current_user.cart.id
    authorize @cart_item
    respond_to do |format|
      if @cart_item.save
        format.js { render js: 'alert("Item added to cart");' }
      else
        format.js { render js: 'alert("Error in adding to cart\nAlready in cart");' }
      end
    end
  end

  def destroy
    @cart_item.destroy
    @coupon = current_user.cart.coupon
    @cart_sub_total = CartsHelper.calculate_cart_sub_total(current_user)
    render js: 'alert("Error in removing item from cart");' unless @cart_item.destroyed?
  end

  def edit; end

  def update
    @coupon = current_user.cart.coupon
    respond_to do |format|
      if @cart_item.update(cart_product_params)
        @cart_sub_total = CartsHelper.calculate_cart_sub_total(current_user)
        format.js
      else
        format.js do
          render js: 'alert("Error in updating cart_item\nShould not be greater than product.);'
        end
      end
    end
  end

  private

  def set_cart_item
    @cart_item = CartProduct.find(params[:id])
  end

  def cart_product_params
    params.permit(:product_id, :quantity)
  end
end
