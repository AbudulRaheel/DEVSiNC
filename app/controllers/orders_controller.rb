# frozen_string_literal: true

# Orders controller
class OrdersController < ApplicationController
  before_action :find_order_details

  def index
    @orders = current_user.orders
  end

  def complete
    ActiveRecord::Base.transaction do
      order = Order.create(user_id: current_user.id, coupon_id: @cart.coupon_id, total: @total_amount)
      create_order @cart_sub_total, @total_amount, order
    end
    redirect_to orders_url, notice: 'Order Complete Sucessfully'
  end

  def create_order(_cart_sub_total, _total_amount, order)
    cart_items = @cart.cart_products
    cart_items.each do |item|
      OrderDetail.create(order_id: order.id, product_id: item.product_id, quantity: item.quantity)
      item.product.decrement!(:quantity, item.quantity)
    end
    if cart_items.destroy_all
      @cart.update(coupon_id: nil)
    else
      flash.alert = 'Order incomplete!'
    end
  end

  def detail
    order = Order.find(params[:id])
    @order_items_list = order.order_details.eager_load(:product)
  end

  private

  def find_order_details
    @cart = current_user.cart
    @cart_sub_total = CartsHelper.calculate_cart_sub_total(current_user)
    @coupon = @cart.coupon
    @total_amount = @cart_sub_total * (@coupon.nil? ? 1 : (1 - @coupon.discount))
  end
end
