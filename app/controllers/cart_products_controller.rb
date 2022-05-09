# frozen_string_literal: true

# CartProductsController
class CartProductsController < ApplicationController
  include CartsHelper
  before_action :set_cart_item, only: %i[edit update destroy]
  before_action :load_data, only: %i[destroy update]

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
    if @cart_item.destroy
      redirect_to carts_path
    else
      format.js { render js: 'alert("Error in removing item from cart");' }

    end
  end

  def update
    respond_to do |format|
      if @cart_item.update(cart_product_params)
        format.js
      else
        format.js { render js: 'alert("Error: Extreme quantity reached");' }
      end
    end
  end

  private

  def load_data
    @coupon = current_user.cart.coupon
    @cart_sub_total = CartsHelper.calculate_cart_sub_total(current_user)
  end

  def set_cart_item
    @cart_item = CartProduct.find(params[:id])
  end

  def cart_product_params
    params.require(:cart_products).permit(:product_id, :quantity)
  end
end
