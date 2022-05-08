# frozen_string_literal: true

# CartsController
class CartsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :load_cart_data, only: %i[index edit update destroy]
  before_action :load_coupon, only: %i[coupon]
  include CartsHelper

 

  def update
    respond_to do |format|
      if current_user.cart.update(cart_params)
        format.js
      else
        format.js { render js: 'alert("Error in updating sub_total of cart");' }
      end
    end
  end

  def coupon
    if @coupon && @coupon.expiry_date > Time.zone.today
      process_coupon @coupon
    else
      render js: "alert('No such Coupon exist')"
    end
  end

  private

  def process_coupon(coupon)
    respond_to do |format|
      if current_user.cart.update(coupon_id: coupon.id)
        format.js
        redirect_to carts_path 
      else
        format.js { render js: 'alert("Invalid Coupon");' }
      end
    end
  end

  def cart_params
    params.require(:cart).permit(:sub_total)
  end

  def load_coupon
    @coupon = Coupon.find_by(code: params[:coupon])
  end

  def load_cart_data
    @cart_items = CartProduct.includes(:product).where(cart_id: current_user.cart.id)
    @cart_sub_total = CartsHelper.calculate_cart_sub_total(current_user)
    @coupon = current_user.cart.coupon
  end
end
