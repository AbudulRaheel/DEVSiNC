# frozen_string_literal: true

# CartsController
class CartsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  include CartsHelper

  def index
    @cart_items = CartProduct.includes(:product).where(cart_id: current_user.cart.id)
    @cart_sub_total = CartsHelper.calculate_cart_sub_total(current_user)

    @coupon = current_user.cart.coupon
  end

  def update
    respond_to do |format|
      if current_user.cart.update(cart_params)
        format.js
      else
        format.js { render js: 'alert("Error in updating sub_total of cart");' }
      end
    end
  end

  def show; end

  def coupon
    @coupon = Coupon.find_by(code: params[:coupon])
    if @coupon && @coupon.expiry_date > Time.zone.today
      @cart_sub_total = CartsHelper.calculate_cart_sub_total(current_user)
      process_coupon @coupon
    else
      render js: "alert('No such Coupon exist')"
    end
  end

  def process_coupon(coupon)
    respond_to do |format|
      if current_user.cart.update(coupon_id: coupon.id)
        format.js
      else
        format.js { render js: 'alert("Invalid Coupon");' }
      end
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:sub_total)
  end
end
